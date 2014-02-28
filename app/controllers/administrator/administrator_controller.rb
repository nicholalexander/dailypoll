class Administrator::AdministratorController < Administrator::BaseController
	def index
		@questions = Question.all

	end
end