class UserHasSubmittedReview < ActiveRecord::Migration[5.0]
  def change
     add_column :users, :submitted_review, :tinyint
  end
end
