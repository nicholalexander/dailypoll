class QuestionsController < ApplicationController
	respond_to :html, :js, :json

	def index

	end

	def show
		@question = Question.find(params[:id])
		@yes_votes = 0
		@no_votes = 0
		@question.votes.each do |vote|
			if vote.vote == 1
				@yes_votes += 1
			else
				@no_votes += 1
			end
		end
	end




end