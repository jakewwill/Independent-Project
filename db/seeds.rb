require 'csv'

CSV.foreach(Rails.root.join('res', 'Colleges.csv'), :headers => true) do |row|
      College.create!(row.to_hash)
end