class Administrator::QuestionsController < Administrator::BaseController



	def create
		binding.pry
		Question.create(question_params)
		redirect_to administrator_path
	end


	private
		def question_params
			params.require(:question).permit(:text, :date)
		end
end