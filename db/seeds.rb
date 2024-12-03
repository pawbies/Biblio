# db/seeds.rb
# Warning: This file contains ridiculous seed data. Proceed with caution and a sense of humor.

puts "Seeding database... 🤡"

# Publishers
publisher = Publisher.create!(
  name: "Quirky Books Inc.",
  email: "contact@quirkybooks.example",
  url: "http://www.quirkybooks.example"
)
puts "Publisher created: #{publisher.name}"

# Categories
categories = %w[Comedy Thriller Romance Sci-Fi Mystery Self-Help].map do |name|
  Category.create!(name: name, description: "#{name} books that keep you hooked.")
end
puts "Categories created: #{categories.map(&:name).join(', ')}"

# Authors
authors = [
  { firstname: "Chuck", lastname: "Bananapeel", artistname: "Slip Writer", bio: "Writes jokes that you can trip on." },
  { firstname: "Luna", lastname: "Eclipse", artistname: "Dark Whisper", bio: "The queen of mysterious plots." },
  { firstname: "Cindy", lastname: "Sparkle", artistname: "RomanceDiva", bio: "Everything love and glitter." }
].map { |data| Author.create!(data) }
puts "Authors created: #{authors.map(&:artistname).join(', ')}"

# Books
books = [
  { title: "The Great Banana Heist", description: "A comedy about stealing bananas, but with a twist.", isbn: "LOL123", price: 9.99, amount: 50 },
  { title: "Moonlit Mayhem", description: "A thrilling journey under the moon's shadow.", isbn: "THR456", price: 12.49, amount: 20 },
  { title: "Glitter & Heartache", description: "Romantic drama with extra sparkle.", isbn: "ROM789", price: 8.95, amount: 30 }
].map.with_index do |data, index|
  Book.create!(data.merge(publisher: publisher, authors: [ authors[index] ], categories: [ categories[index] ]))
end
puts "Books created: #{books.map(&:title).join(', ')}"

# Librarians
librarian = Librarian.create!(
  firstname: "Dewey",
  lastname: "Decimal",
  email: "dewey@library.example",
  password_digest: "password123"
)
puts "Librarian created: #{librarian.firstname} #{librarian.lastname}"

# Borrows
borrows = [
  { borrow_date: Date.today, return_date: Date.today + 14, actual_return_date: nil, returned: false, firstname: "Alice", lastname: "Wonderland", phone: "123-456-7890", email: "alice@example.com" },
  { borrow_date: Date.today - 10, return_date: Date.today + 4, actual_return_date: nil, returned: false, firstname: "Bob", lastname: "Builder", phone: "234-567-8901", email: "bob@example.com" }
].map do |data|
  Borrow.create!(data.merge(librarian: librarian, books: books.sample(1)))
end
puts "Borrows created for: #{borrows.map { |b| b.firstname + ' ' + b.lastname }.join(', ')}"

# Reviews
reviews = [
  { message: "This book changed my life... or at least my afternoon.", rating: 5, anonymous: false },
  { message: "Bananas have never been this thrilling!", rating: 4, anonymous: true }
].each_with_index.map do |data, index|
  Review.create!(data.merge(book: books[index], borrow: borrows[index]))
end
puts "Reviews created: #{reviews.size}"

puts "Seeding complete! 🌱"
