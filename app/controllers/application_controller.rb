class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    @current_user ||= find_current_user
  end

  private

  def find_current_user
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      user ||= User.new(balance: 0) # Create a new user with zero balance if not found
    else
      User.new # Guest user
    end
  end
end
