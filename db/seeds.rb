require 'csv'

User.create!(name: "Site Admin", email: "admin@gmail.com", password: "puns123", password_confirmation: "puns123", alumni: false)
user = User.find_by(name: "Site Admin");
user.update_attribute(:admin, 1);

# Populate the database with college names
if (College.count == 0)
    CSV.foreach(Rails.root.join('res', 'Colleges.csv'), :headers => true) do |row|
          College.create!(row.to_hash)
    end
end

