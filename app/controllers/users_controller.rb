class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update]
  before_action :user_authorized?, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to users_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def user_authorized?
    get_user
    unless current_user == @user
      flash[:alert] = "We're sorry, that's not your profile. Redirected to your profile page"
      redirect_to user_path(current_user)
    end
  end
end
