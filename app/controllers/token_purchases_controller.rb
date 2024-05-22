class TokenPurchasesController < ApplicationController

  def new
    @user = current_user
    render layout: false

  end
    
  def create
    amount = params[:amount].to_f
    @user = current_user
    if @user
      @user.update_attribute(:balance, @user.balance + amount)
    end
  end
end
