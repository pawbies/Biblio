class CreateBorrows < ActiveRecord::Migration[7.2]
  def change
    create_table :borrows do |t|
      t.date :borrow_date
      t.date :return_date
      t.date :actual_return_date
      t.boolean :returned
      t.references :librarian, null: true, foreign_key: true # dont delete borrow with librarian
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
