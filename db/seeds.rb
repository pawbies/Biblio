require 'faker'

publishers = []
5.times do |i|
  publishers << Publisher.create!(
    name: "#{Faker::Book.publisher}",
    email: Faker::Internet.unique.email,
    url: Faker::Internet.unique.url
  )
end

categories = []
10.times do |i|
  categories << Category.create!(
    name: "#{Faker::Book.unique.genre}",
    description: Faker::Lorem.unique.sentence
  )
end

authors = []
10.times do |i|
  authors << Author.create!(
    firstname: Faker::Name.unique.first_name,
    lastname: Faker::Name.unique.last_name,
    artistname: [ Faker::Music.unique.band, nil ].sample, # 50% chance of having an artist name
    bio: Faker::Lorem.unique.paragraph
  )
end

books = []
100.times do |i|
  book = Book.create!(
    title: "#{Faker::Book.unique.title}",
    description: Faker::Lorem.unique.paragraph(sentence_count: 3),
    isbn: Faker::Code.unique.isbn,
    price: Faker::Commerce.price(range: 5.0..50.0, as_string: false),
    publisher: publishers.sample,
    amount: rand(1..100)
  )
  # Assign unique authors to each book
  book.authors << authors.sample(rand(1..3)).uniq

  # Assign unique categories to each book
  book.categories << categories.sample(rand(1..5)).uniq

  books << book
end

librarians = Librarian.all
# 5.times do |i|
#   librarians << Librarian.create!(
#     firstname: Faker::Name.unique.first_name,
#     lastname: Faker::Name.unique.last_name,
#     email: Faker::Internet.unique.email,
#     password: "password"
#   )
# end

borrows = []
5.times do |i|
  borrow_date = Faker::Date.backward(days: 100)
  return_date = borrow_date + rand(7..21)
  actual_return_date = [ return_date + rand(-3..5), nil ].sample
  returned = actual_return_date.present?

  borrow = Borrow.create!(
    borrow_date: borrow_date,
    return_date: return_date,
    actual_return_date: actual_return_date,
    returned: returned,
    librarian: librarians.first,
    firstname: Faker::Name.unique.first_name,
    lastname: Faker::Name.unique.last_name,
    phone: Faker::PhoneNumber.unique.cell_phone,
    email: Faker::Internet.unique.email
  )

  borrow.books << books.sample(rand(1..3)).uniq

  borrows << borrow
end
