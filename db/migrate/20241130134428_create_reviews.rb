class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.text :message
      t.integer :rating
      t.references :book, null: false, foreign_key: true
      t.references :borrow, null: false, foreign_key: true

      t.timestamps
    end
  end
end
