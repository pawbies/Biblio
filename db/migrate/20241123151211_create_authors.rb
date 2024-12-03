class CreateAuthors < ActiveRecord::Migration[7.2]
  def change
    create_table :authors do |t|
      t.string :firstname, limit: 50
      t.string :lastname, limit: 50
      t.string :artistname, limit: 50
      t.text :bio, limit: 500

      t.timestamps
    end
  end
end
