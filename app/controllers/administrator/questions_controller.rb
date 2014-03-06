class Administrator::QuestionsController < Administrator::BaseController



	def create
		question = Question.create(question_params)
		# send_text_message(question)
		redirect_to administrator_path
	end

	def edit	
		@question = Question.find(params[:id])
	end

	def show
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		@question.update_attributes(question_params)
		redirect_to administrator_path
	end

	def destroy
		@question = Question.find(params[:id])
		@question.delete
		redirect_to administrator_path
	end


	private
		def question_params
			params.require(:question).permit(:text, :date)
		end
end