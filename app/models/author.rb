class Author < ApplicationRecord
  has_and_belongs_to_many :books

  validates :firstname, length: { maximum: 30 }
  validates :lastname, length: { maximum: 30 }
  validates :artistname, length: { maximum: 50 }
  validates :bio, length: { maximum: 500 }
end
