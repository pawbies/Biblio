class Review < ApplicationRecord
  has_many :reports, dependent: :destroy
  belongs_to :book
  belongs_to :borrow

  validates :message, length: { maximum: 300 }
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :anonymous, inclusion: { in: [ true, false ] }

  def name
    "#{borrow.firstname} #{borrow.lastname}"
  end
end
