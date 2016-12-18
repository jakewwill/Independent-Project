class Ranking < ApplicationRecord
    belongs_to :user
    
    validates(:name, presence: true)
    validates(:response1, presence: true)
    validates(:response2, presence: true)
end
