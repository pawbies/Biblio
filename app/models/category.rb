class Category < ApplicationRecord
  has_and_belongs_to_many :books

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 100 }
end
