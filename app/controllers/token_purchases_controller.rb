class TokenPurchasesController < ApplicationController

  def new
    @current_user
    render layout: false

  end
    
  def create
    amount = params[:amount].to_f
    @user = current_user
    puts "User balance: #{@user.balance}"

    if @user
      new_balance = @user.balance.to_f + amount
      if @user.update!(balance: new_balance)
        puts "Balance updated successfully!"
        puts "User balance: #{new_balance}"
      end
  end
end
end
