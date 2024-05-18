class TokenPurchasesController < ApplicationController
  def new
    @user = FakeUser.find_by(email: 'a@a.a')
    render layout: false
  end
    
  def create
    amount = params[:amount].to_f
    @user = FakeUser.find_by(email: 'a@a.a')
    if @user
      @user.update_attribute(:balance, @user.balance + amount)
    end
    puts @user.inspect
  end
end
