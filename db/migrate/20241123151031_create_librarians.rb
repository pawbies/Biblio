class CreateLibrarians < ActiveRecord::Migration[7.2]
  def change
    create_table :librarians do |t|
      t.string :firstname, null: false, limit: 30
      t.string :lastname, null: false, limit: 30
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
