class ReviewsController < ApplicationController
  # GET /reviews/new
  def new
    @token = params[:token]
    @borrow = Borrow.find_by_token_for(:review_token, @token)
  end

  # POST /reviews
  def create
    @borrow = Borrow.find_by_token_for(:review_token, params[:token])
    @books = @borrow.books

    @books.each do |book|
      review_params = params.dig(:reviews, book.id.to_s)
      next unless review_params.present? && review_params[:enabled] == "true"

      @borrow.reviews.create!(
        book: book,
        rating: review_params[:rating],
        message: review_params[:message],
        anonymous: review_params[:anonymous] == "true"
      ) if review_params.present?
    end

    redirect_to root_path, notice: "Reviews wurden gespeichert."
  end
end
