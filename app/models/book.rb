class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :borrows
  has_and_belongs_to_many :categories
  belongs_to :publisher

  paginates_per 6
  has_one_attached :cover

  validates :title, presence: true, length: { maximum: 60 }
  validates :description, length: { maximum: 300 }
  validates :isbn, length: { maximum: 30 }
  validates :publisher, presence: true

  def effective_amount
    amount - borrows.count
  end

  def average_rating
    return nil if borrows.where.not(rating: nil).empty?
    borrows.where.not(rating: nil).average(:rating).to_f
  end
end
