class QuestionsController < ApplicationController
	respond_to :html, :js, :json
	before_filter :authorize_user

	def index
		@questions = Question.where(['date < ?', Time.now])
		yes_votes = 0
		no_votes = 0
		@question_hash = {}
		@questions.each do |question|
			question.votes.each do |vote|
				if vote.vote == 1
					yes_votes += 1
				else
					no_votes += 1
				end
			end
			@question_hash[question.id] = {yes: yes_votes, no: no_votes}
			yes_votes = 0
			no_votes = 0
		end

		#send question hash to view and to javascript
		gon.question_hash = @question_hash

		#send all questions and question hash to view
	end

	def show
		@question = Question.find(params[:id])
		@question_hash = {}
		yes_votes = 0
		no_votes = 0
		@question.votes.each do |vote|
			if vote.vote == 1
				yes_votes += 1
			else
				no_votes += 1
			end
		end
		@question_hash[@question.id] = {yes: yes_votes, no: no_votes}
		gon.question_hash = @question_hash
		end


	end




end