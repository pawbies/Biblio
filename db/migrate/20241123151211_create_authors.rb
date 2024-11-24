class CreateAuthors < ActiveRecord::Migration[7.2]
  def change
    create_table :authors do |t|
      t.string :firstname
      t.string :lastname
      t.string :artistname
      t.text :bio

      t.timestamps
    end
  end
end
