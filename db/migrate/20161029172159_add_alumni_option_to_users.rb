class AddAlumniOptionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :alumni, :string
  end
end
