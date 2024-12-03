class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false, limit: 30
      t.text :description, limit: 100

      t.timestamps
    end
  end
end
