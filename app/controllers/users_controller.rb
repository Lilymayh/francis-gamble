class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/games"
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      render 'pages/home'
    end
  end

  private

  def user_params
    params.require(:users).permit(:email, :password, :password_confirmation)
  end
end
