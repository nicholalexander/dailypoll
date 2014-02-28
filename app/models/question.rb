class Question < ActiveRecord::Base
	has_many :votes
	validates :text, presence: true
	validates :date, uniqueness: true
end