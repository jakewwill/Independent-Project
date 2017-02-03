class RankingsCount < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :rankings_count, :int
  end
end
