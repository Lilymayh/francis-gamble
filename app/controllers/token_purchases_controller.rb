class TokenPurchasesController < ApplicationController
  def new_token_purchase
    @user = FakeUser.find_by(email: 'a@a.a')
    render layout: false
  end
    
  def create_token_purchase
    amount = params[:amount].to_f
    @user = FakeUser.find_by(email: 'a@a.a')
    if @user
      if @user.update(balance: @user.balance + amount)
        flash[:notice] = "Token purchase successful!"
      else
        flash[:alert] = "Failed to update balance."
      end
    else
      flash[:alert] = "User not found."
    end
    redirect_to tokens_path
  end
end