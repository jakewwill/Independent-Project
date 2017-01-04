class AddResponsesToRankingsColumn < ActiveRecord::Migration[5.0]
  def change
     add_column :rankings, :name, :string
     add_column :rankings, :college_name, :string
     add_column :rankings, :response1, :string
     add_column :rankings, :response1_explanation, :text
     add_column :rankings, :response2, :string
     add_column :rankings, :response2_explanation, :text
     add_column :rankings, :response3, :string
     add_column :rankings, :response3_explanation, :text
     add_column :rankings, :response4, :string
     add_column :rankings, :response4_explanation, :text
     add_column :rankings, :response5, :string
     add_column :rankings, :response5_explanation, :text
     add_column :rankings, :response6, :string
     add_column :rankings, :response6_explanation, :text
     add_column :rankings, :response7, :string
     add_column :rankings, :response7_explanation, :text
     add_column :rankings, :response8, :string
     add_column :rankings, :response8_explanation, :text
     add_column :rankings, :response9, :string
     add_column :rankings, :response9_explanation, :text
     add_column :rankings, :response10, :string
     add_column :rankings, :response10_explanation, :text
  end
end
