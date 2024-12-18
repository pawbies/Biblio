class AddReviewedToBorrows < ActiveRecord::Migration[7.2]
  def change
    add_column :borrows, :reviewed, :boolean, null: false, default: false
  end
end
