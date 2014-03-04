class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :question

	def save_the_vote(user, text)
		question = Question.active
		
		self.user_id = user.id
		self.question_id = question.id
		text_response = process_text(text)
		
		existing_vote = Vote.find_by(:user_id => user.id, :question_id => question.id)
		# if vote is nil, then we want to create a new instance of vote and persist
		if existing_vote.nil?
			text_response == 'y' ? self.vote = 1 : self.vote = 0
			self.save
		else
		#if vote is not nil, then we want to update the current instance of vote and persist 
			text_response == "y" ? existing_vote.vote = 1 : existing_vote.vote = 0
			existing_vote.save
		end
	end

	def process_text(text)
		text.downcase!
		if /[yes]/ === text
			return "y"
		else
			return "n"
		end
	end


end