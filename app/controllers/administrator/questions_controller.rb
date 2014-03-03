class Administrator::QuestionsController < Administrator::BaseController



	def create
		question = Question.create(question_params)
		# send_text_message(question)
		redirect_to administrator_path
	end


	private
		def question_params
			params.require(:question).permit(:text, :date)
		end
end