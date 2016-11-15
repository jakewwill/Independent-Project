require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import, [:filename] => :environment do
    CSV.foreach('/Users/Jake/Desktop/Independent-Project/res/Colleges.csv', :headers => true) do |row|
      College.create!(row.to_hash)
    end
end