class PagesController < ApplicationController
  def home
    @books = Book.all.select { |book| book.effective_amount > 0 }.first(9)
    @authors = Author.limit(8)
  end

  def search
    if params[:query].present?
      @query = params[:query]
      @books =
        Book.joins(:authors, :categories).where(
          "books.title LIKE :query OR books.isbn LIKE :query OR authors.firstname LIKE :query OR authors.lastname LIKE :query OR authors.artistname LIKE :query OR categories.name LIKE :query",
          query: "%#{@query}%"
        ).distinct.page(params[:book_page] || 1)
      @authors =
        Author.where(
          "firstname LIKE :query OR lastname LIKE :query OR artistname LIKE :query",
          query: "%#{@query}%"
        ).page(params[:author_page] || 1)
      @categories =
        Category.where(
          "name LIKE :query",
          query: "%#{@query}%"
        ).page(params[:category_page] || 1)
    else
      @query = nil
      @books = nil
      @authors = []
    end
  end
end
