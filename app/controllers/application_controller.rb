class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def current_user
    @current_user = User.find_by(id: session[:users_id])
  end
end
