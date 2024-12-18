class ReviewsController < ApplicationController
  before_action :fetch_borrow
  before_action :check_borrow

  # GET /reviews/new
  def new
  end

  # POST /reviews
  def create
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

    @borrow.update(reviewed: true)

    redirect_to root_path, notice: "Reviews wurden gespeichert."
  end

  private

  def fetch_borrow
    @token = params[:token]
    @borrow = Borrow.find_by_token_for(:review_token, @token)
  end

  def check_borrow
    redirect_to root_path, notice: "Reviews wurden bereits geschrieben" if @borrow.reviewed?
  end
end
