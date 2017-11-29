class Review < ApplicationRecord
    validates(:name, :college_name, :year_completed, :punahou_graduation_year, :gender, :major, presence: true)
end
