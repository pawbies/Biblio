json.extract! author, :id, :firstname, :lastname, :artistname, :bio, :created_at, :updated_at
json.url author_url(author, format: :json)
