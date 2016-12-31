class Review < ApplicationRecord
    validates(:question1, presence: true, length: {minimum: 20})
    validates(:name, presence: true)
end
