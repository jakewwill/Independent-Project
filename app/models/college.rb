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
  end
  
  def self.search(search)
    if search
      self.where("name like ?", "%#{search}%")
    else
      self.all
    end
  end
end