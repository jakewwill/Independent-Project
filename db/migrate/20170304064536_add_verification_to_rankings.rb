class AddVerificationToRankings < ActiveRecord::Migration[5.0]
  def change
    add_column :rankings, :verified, :boolean, default: false
  end
end
