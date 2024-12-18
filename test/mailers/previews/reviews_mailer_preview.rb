# Preview all emails at http://localhost:3000/rails/mailers/reviews_mailer
class ReviewsMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/reviews_mailer/new
  def new
    ReviewsMailer.with(borrow: Borrow.first).new
  end
end
