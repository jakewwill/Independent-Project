require 'csv'

if (College.count == 0)
    CSV.foreach(Rails.root.join('res', 'Colleges.csv'), :headers => true) do |row|
          College.create!(row.to_hash)
    end
end
if (User.count == 0)
    User.create!(name: "Site Admin", 
        email: "admin@gmail.com", 
        password: "equinox1", 
        password_confirmation: "equinox1", 
        alumni: false)   
    
    User.create!(name: "Alumn", 
        email: "alumn@gmail.com", 
        password: "equinox1", 
        password_confirmation: "equinox1", 
        alumni: true)   
        
    User.create!(name: "Alumn2", 
        email: "alumn2@gmail.com", 
        password: "equinox1", 
        password_confirmation: "equinox1", 
        alumni: true)   
end

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               alumni: false)
end