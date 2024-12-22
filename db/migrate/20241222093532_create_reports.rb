class CreateReports < ActiveRecord::Migration[7.2]
  def change
    create_table :reports do |t|
      t.references :review, null: false, foreign_key: true
      t.text :message, null: false

      t.timestamps
    end
  end
end
