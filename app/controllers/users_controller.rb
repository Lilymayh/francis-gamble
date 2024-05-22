class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/games"
    else
      # Handle validation errors
      render 'pages/home'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :balance)
  end
end