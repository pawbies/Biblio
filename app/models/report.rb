class Report < ApplicationRecord
  belongs_to :review

  validates :message, presence: true, length: { within: 10..200 }
end
