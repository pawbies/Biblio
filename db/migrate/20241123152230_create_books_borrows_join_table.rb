class CreateBooksBorrowsJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :books, :borrows do |t|
      # t.index [:book_id, :borrow_id]
      # t.index [:borrow_id, :book_id]
    end
  end
end
