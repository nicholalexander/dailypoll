class Question < ActiveRecord::Base
	has_many :votes
	validates :text, presence: true
	validates :date, uniqueness: true, presence: true

	def self.active
    today = Time.now.strftime("%Y-%m-%d")
    question = Question.find_by(date: today)
    return question
  end
end