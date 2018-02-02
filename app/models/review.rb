class Review < ApplicationRecord
    validates(:name, :college_name, :year_completed, :punahou_graduation_year, :gender, :major, presence: true)
    
    def self.find_by_first_letter_of_college(letter)
        find(:all, :conditions => ['college_name LIKE ?', "#{letter}%"], :order => 'title ASC')
    end
end
