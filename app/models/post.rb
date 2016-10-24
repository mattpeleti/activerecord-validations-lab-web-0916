class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait

	def clickbait
		phrases = ["Won't Believe", "Secret", "Guess", "Top "]
		if title && !phrases.any?{|phrase| title.include?(phrase)}
			errors.add(:title, "Must be clickbait")
		end
  end
end
