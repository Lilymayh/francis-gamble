class SessionsController < ApplicationController
  def new
  end

	def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
  session[:fake_users_id] = user.id
      redirect_to "/games"
    else
      redirect_to "/"
    end
  end

  def destroy
  end
end