class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title, null: false, limit: 60
      t.text :description, limit: 300
      t.string :isbn, limit: 30
      t.float :price
      t.references :publisher, null: false, foreign_key: true
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
