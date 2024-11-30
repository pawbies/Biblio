class PagesController < ApplicationController
  def home
    @books = Book.limit(9) # Fetch the top 9 books
    @authors = Author.limit(8) # Fetch the top 8 authors
  end

  def search
    if params[:query].present?
      @query = params[:query]
      @books =
        Book.joins(:authors).where(
          "books.title LIKE :query OR authors.firstname LIKE :query OR authors.lastname LIKE :query OR authors.artistname LIKE :query",
          query: "%#{@query}%"
        ).distinct.page(params[:book_page] || 1)
      @authors =
        Author.where(
          "firstname LIKE :query OR lastname LIKE :query OR artistname LIKE :query",
          query: "%#{@query}%"
        ).page(params[:author_page] || 1)
    else
      @query = nil
      @books = nil
      @authors = []
    end
  end
end
