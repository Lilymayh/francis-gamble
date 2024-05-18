class TokenPurchasesController < ApplicationController

  def new_token_purchase
    @user = FakeUser.find_by(email: 'a@a.a')
  end
    
  def create_token_purchase
    amount = params[:amount].to_f
    @user = FakeUser.find_by(email: 'a@a.a')
    if @user
      @user.update_attribute(:balance, @user.balance + amount)
    end
    puts @user.inspect # This line will output the user object to the console
  end

end