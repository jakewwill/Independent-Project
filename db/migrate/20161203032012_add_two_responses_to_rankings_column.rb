class AddTwoResponsesToRankingsColumn < ActiveRecord::Migration[5.0]
  def change
     add_column :rankings, :name, :string
     add_column :rankings, :college_name, :string
     add_column :rankings, :response1, :string
     add_column :rankings, :response2, :string
  end
end
