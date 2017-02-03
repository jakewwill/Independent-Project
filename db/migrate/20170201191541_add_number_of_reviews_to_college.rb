class AddNumberOfReviewsToCollege < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :reviews_count, :int
  end
end
