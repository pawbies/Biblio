class Borrow < ApplicationRecord
  has_and_belongs_to_many :books
  belongs_to :librarian, optional: true
  has_many :reviews, dependent: :destroy

  validates :borrow_date, presence: true
  validates :return_date, presence: true
  validates :returned, inclusion: { in: [ true, false ] }
  validates :firstname, presence: true, length: { maximum: 30 }
  validates :lastname, presence: true, length: { maximum: 30 }
  validates :phone, length: { maximum: 30 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validate :book_amount_check, if: :new_record?
  validate :min_one_book

  generates_token_for :review_token, expires_in: 24.hours

  private

  def min_one_book
    errors.add(:books, " müssen hinzugefügt werden.") if books.empty?
  end

  def book_amount_check
    titles = []

    books.each do |book|
      titles.push(book.title) if book.effective_amount <= 0
    end

    errors.add(:books, " (#{titles.join(', ')}) sind nicht genug da.") unless titles.empty?
  end
end
