class Borrow < ApplicationRecord
  has_and_belongs_to_many :books
  belongs_to :librarian

  validates :borrow_date, presence: true
  validates :return_date, presence: true
  validates :returned, inclusion: { in: [ true, false ] }
  validates :firstname, presence: true, length: { maximum: 30 }
  validates :lastname, presence: true, length: { maximum: 30 }
  validates :phone, length: { maximum: 30 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
