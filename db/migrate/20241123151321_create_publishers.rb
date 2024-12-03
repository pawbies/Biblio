class CreatePublishers < ActiveRecord::Migration[7.2]
  def change
    create_table :publishers do |t|
      t.string :name, null: false, limit: 50
      t.string :email
      t.string :url

      t.timestamps
    end
  end
end
