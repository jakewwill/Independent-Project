require 'csv'

CSV.foreach(Rails.root.join('res', 'Colleges.csv'), :headers => true) do |row|
      College.create!(row.to_hash)
end

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