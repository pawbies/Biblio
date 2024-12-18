class ReviewsMailer < ApplicationMailer
  def new
    @borrow = params[:borrow]
    @token = @borrow.generate_token_for(:review_token)
    mail to: @borrow.email
  end
end
