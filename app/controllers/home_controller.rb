class HomeController < ApplicationController
	def index
		if session[:user_id]
			redirect_to questions_path
		end
	end
end