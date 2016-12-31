class Ranking < ApplicationRecord
    validates(:name, presence: true)
    validates(:response1, presence: true)
    validates(:response2, presence: true)
end
