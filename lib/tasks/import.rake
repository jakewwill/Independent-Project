require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import, [:filename] => :environment do
    CSV.foreach(Rails.root.join('res', 'Colleges.csv'), :headers => true) do |row|
      College.create!(row.to_hash)
    end
end