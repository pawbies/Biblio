class Review < ApplicationRecord
  belongs_to :book
  belongs_to :borrow

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :message, length: { maximum: 300 }
  validates :anonymous, inclusion: { in: [ true, false ] }
end
