class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :borrows
  has_and_belongs_to_many :categories
  belongs_to :publisher

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 300 }
  validates :isbn, length: { maximum: 20 }
  validates :publisher, presence: true

  def effective_amount
    amount - borrows.count
  end
end
