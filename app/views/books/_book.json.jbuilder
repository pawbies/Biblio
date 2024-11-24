json.extract! book, :id, :title, :description, :isbn, :price, :publisher_id, :amount, :created_at, :updated_at
json.url book_url(book, format: :json)
