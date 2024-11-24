json.extract! borrow, :id, :borrow_date, :return_date, :actual_return_date, :returned, :librarian_id, :firstname, :lastname, :phone, :email, :created_at, :updated_at
json.url borrow_url(borrow, format: :json)
