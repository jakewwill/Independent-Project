class AddUnitidToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :unitid, :string
  end
end
