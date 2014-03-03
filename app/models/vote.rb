class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :question

	def save_the_vote(user, text)
		#Should extract this to helper method - duplicate cod
		question = Question.active
		
		self.user_id = user.id
		self.question_id = question.id
		
		vote = Vote.find_by(:user_id => user.id, :question_id => question.id)
		if vote.nil?
			if text == 'Yes'
				self.vote = 1
			else 
				self.vote = 0
			end
			self.save
		else 
			if text == "Yes"
				vote.vote = 1
			else
				vote.vote = 0
			end
			vote.save
		end
	end
end