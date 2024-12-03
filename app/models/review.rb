class Review < ApplicationRecord
  belongs_to :book
  belongs_to :borrow

  validates :message, length: { maximum: 300 }
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :anonymous, inclusion: { in: [ true, false ] }
end
