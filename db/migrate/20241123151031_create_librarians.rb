class CreateLibrarians < ActiveRecord::Migration[7.2]
  def change
    create_table :librarians do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
