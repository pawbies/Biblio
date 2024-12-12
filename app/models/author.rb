class Author < ApplicationRecord
  has_and_belongs_to_many :books

  validates :firstname, length: { maximum: 50 }
  validates :lastname, length: { maximum: 50 }
  validates :artistname, length: { maximum: 50 }
  validates :bio, length: { maximum: 500 }

  paginates_per 4
  has_one_attached :pfp

  def display_name
    if artistname.present?
      artistname
    else
      [ firstname, lastname ].compact.join(" ").strip.presence || "Unknown Author"
    end
  end
end
