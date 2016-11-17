class Review < ApplicationRecord
    belongs_to :user
    
    validates(:question1, presence: true, length: {minimum: 20})
    validates(:name, presence: true)
end
