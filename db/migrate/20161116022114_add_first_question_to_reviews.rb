class AddFirstQuestionToReviews < ActiveRecord::Migration[5.0]
  def change
     add_column :reviews, :question1, :text
  end
end
