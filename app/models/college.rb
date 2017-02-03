class College < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?
  require 'csv'

  validates :unitid, presence: true, uniqueness: { case_sensitive: true }

  def self.import(file)
    CSV.foreach(file.path, :headers => true) do |row|
      College.create!(row.to_hash)
    end
  end
  
  def set_defaults
    self.reviews_count = 0;
    self.rankings_count = 0;
  end
end