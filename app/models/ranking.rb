class Ranking < ApplicationRecord
    validates(:name, presence: true)
    validates(:college_name, presence: true)
end