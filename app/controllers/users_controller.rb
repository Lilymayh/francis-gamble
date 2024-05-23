class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # Set the session for the newly created user
      redirect_to "/games"
    else
      # Handle validation errors
      render 'pages/home'
    end
  end

  def subtract_balance
    amount = params[:amount].to_i
    if @current_user.balance >= amount
      @current_user.update(balance: @current_user.balance - amount)
      flash[:notice] = "#{amount} tokens have been subtracted from your balance."
    else
      flash[:alert] = "Insufficient balance to subtract #{amount} tokens."
    end
    redirect_back(fallback_location: tictactoe_index_path)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :balance)
  end
end
