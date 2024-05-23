class TokenPurchasesController < ApplicationController

  def new
    @user = current_user
    if @user
      puts "Current user: #{@user.inspect}"
      render layout: false
    else
      # Redirect or handle unauthorized access
      redirect_to login_path, alert: "Please log in to access this feature."
    end
  end
    
  def create
    amount = params[:amount].to_f
    @user = current_user

    if @user
      puts "User balance before purchase: #{@user.balance}"
      new_balance = @user.balance.to_f + amount
      if @user.update(balance: new_balance)
        puts "Balance updated successfully!"
        puts "User balance after purchase: #{new_balance}"
      end
    else
      # Redirect or handle unauthorized access
      redirect_to login_path, alert: "Please log in to access this feature."
    end
  end
end
