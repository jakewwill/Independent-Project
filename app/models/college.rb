class College < ApplicationRecord
  require 'csv'

  validates :name, presence: true, uniqueness: { case_sensitive: true }

  def self.import(file)
    CSV.foreach(file.path, :headers => true) do |row|
      College.create!(row.to_hash)
    end
  end
end