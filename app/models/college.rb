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
    
    # I don't know if there is a better way to do this, but
    # I am keeping it like this for now
    self.response1_average = 0;
    self.response2_average = 0;
    self.response3_average = 0;
    self.response4_average = 0;
    self.response5_average = 0;
    self.response6_average = 0;
    self.response7_average = 0;
    self.response8_average = 0;
    self.response9_average = 0;
  end
end