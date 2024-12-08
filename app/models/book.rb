class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :borrows
  has_and_belongs_to_many :categories
  has_many :reviews, dependent: :destroy
  belongs_to :publisher

  paginates_per 6
  has_one_attached :cover

  validates :title, presence: true, length: { maximum: 60 }
  validates :description, length: { maximum: 300 }
  validates :isbn, length: { maximum: 30 }
  validates :publisher, presence: true
  validates :amount, presence: true, inclusion: { in: 0..100 }
  validate :positive_effective_amount

  def effective_amount
    amount - borrows.where(returned: false).count
  end

  def average_rating
    return nil if reviews.empty?
    reviews.average(:rating).to_f
  end

  private

  def positive_effective_amount
    errors.add(:effective_amount, " muss mindestens 0 sein.") if effective_amount.negative?
  end
end
