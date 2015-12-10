class ApplicationController < ActionController::Base
	before_action :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def not_authenticated
  	redirect_to login_path, alert: "Must be logged in to do that!"
  end
end
