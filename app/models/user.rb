class User < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?
  
  # Before saving the user to the database, downcase the email
  before_save { self.email = email.downcase }
  
  # Validates the name (makes sure it exists with a max length of 50)
  validates(:name, presence: true, length: {maximum: 50})
  
  # Validates email with correct format, presence and length
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  # Built in method to save securely hashed password to database
  has_secure_password

  # Validate password
  validates :password, presence: true, length: { minimum: 6 }
end
