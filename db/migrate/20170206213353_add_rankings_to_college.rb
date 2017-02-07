class AddRankingsToCollege < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :response1_average, :float
    add_column :colleges, :response2_average, :float
    add_column :colleges, :response3_average, :float
    add_column :colleges, :response4_average, :float
    add_column :colleges, :response5_average, :float
    add_column :colleges, :response6_average, :float
    add_column :colleges, :response7_average, :float
    add_column :colleges, :response8_average, :float
    add_column :colleges, :response9_average, :float
  end
end
