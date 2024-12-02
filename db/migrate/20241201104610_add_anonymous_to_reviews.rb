class AddAnonymousToReviews < ActiveRecord::Migration[7.2]
  def change
    add_column :reviews, :anonymous, :boolean, null: false
  end
end
