class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :non_click_bait

    def non_click_bait
        if title
            bait = ["Won't Believe", "Secret", "Top", "Guess"].any? {|phrase| title.include? (phrase)}
            bait == false && errors.add(:title, "needs more clickbait")
        end
    end
end
