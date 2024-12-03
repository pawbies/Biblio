class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.text :message, limit: 300
      t.integer :rating, null: false
      t.references :book, null: false, foreign_key: true
      t.references :borrow, null: false, foreign_key: true

      t.timestamps
    end
  end
end
