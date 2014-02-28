class Administrator::SessionsController < ApplicationController
	def new

	end

	

	def create
    @admin = Administrator.find_by_email(params[:login][:email])
    if @admin && @admin.authenticate(params[:login][:password])
      session[:admin_id] = @admin.id
      redirect_to administrator_path
    else
      flash.now.alert = "Email or Password Invalid"
      render "new"
    end
  end



  def destroy
    session[:admin_id] = nil
    redirect_to root_url, notice: "logged out!"
  end
end