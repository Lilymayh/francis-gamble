class TokenPurchasesController < ApplicationController
  def new
    render layout: false
  end
    
  def create
    amount = params[:amount].to_i
    @user = current_user
  
    if @user
      new_balance = (@user.balance || 0) + amount
      if @user.update(balance: new_balance)
        puts "Balance updated successfully!"
        puts "User balance: #{new_balance}"
      else
        puts "Failed to update balance"
      end
    else
      puts "User is nil"
    end
  end
end
