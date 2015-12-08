class SessionsController < ApplicationController
  def new
  end

  def create
  	if @user = login(params[:email], params[:password])
  		redirect_back_or_to(:projects, notice: 'Login successful')
  	else
  		flash.now[:alert] = 'Login failed'
  		render :new
  	end
  end

  def destroy
  	logout
  	redirect_to root_path, notice: "You logged out of Crowdfunder"
  end
end
