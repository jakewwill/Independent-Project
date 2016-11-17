class AddCollegeNameToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :college_name, :string
  end
end
