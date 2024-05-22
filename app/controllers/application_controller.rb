class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :current_user

	def current_user
    @current_user = User.find_by(id: 1)
  end
end
