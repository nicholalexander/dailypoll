class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			redirect_to questions_path
		else
			redirect_to root_url :notice => "already exists"
		end
	end

	def show

	end



	private

	def user_params
		params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation)
	end
end