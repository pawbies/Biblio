class AddRatingToBorrow < ActiveRecord::Migration[7.2]
  def change
    add_column :borrows, :rating, :integer
  end
end
