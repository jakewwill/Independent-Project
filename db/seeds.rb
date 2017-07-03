require 'csv'

if (!User.find_by_email("admin@gmail.com"))
    User.create!(name: "Site Admin", email: "admin@gmail.com", password: "puns123", password_confirmation: "puns123")
    user = User.find_by(name: "Site Admin");
    user.update_attribute(:admin, 1);
end

# Populate the database with college names
CSV.foreach(Rails.root.join('res', 'Colleges.csv'), :headers => true, :col_sep => ";:") do |row|
    if (College.where(:name => row.to_hash["name"]).blank?)
        College.create!(row.to_hash)
    end
end