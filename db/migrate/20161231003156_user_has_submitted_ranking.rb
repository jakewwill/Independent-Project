class UserHasSubmittedRanking < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :submitted_ranking, :tinyint
  end
end
