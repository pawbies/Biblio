json.extract! publisher, :id, :name, :email, :url, :created_at, :updated_at
json.url publisher_url(publisher, format: :json)
