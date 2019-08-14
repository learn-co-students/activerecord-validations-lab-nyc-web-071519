class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}

    validate :click_bait


    def click_bait
        # binding.pry
        unless self.title == nil
            unless ["Won't Believe", "Secret", "Top [number]", "Guess"].any?{|word| self.title.include?(word)}
                errors.add(:title, "not click_bait")
            end 
        end
    end
end
