class CheckersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:start]

  def index
    @games = Checkers.all
    render layout: false
  end

  def new
    @checkers = Checkers.new
    render layout: false
  end

  def create
    @checkers = Checkers.new(game_params)
    if @checkers.save
      redirect_to @checkers, notice: 'Checkers game was successfully created.'
    else
      render :new
    end
  end

  def start
    puts "Session data: #{session.inspect}"
    puts "User ID from session: #{session[:user_id]}"
    amount = params[:checkers][:amount].to_i
    if @current_user.balance >= amount
      # Deduct balance before starting the game
      subtract_balance(amount)
      flash[:notice] = "#{amount} tokens have been subtracted from your balance."
      
      # Example logic to start the game and initialize @checkers
      @checkers = Checkers.new(bet_amount: amount)  # Adjust attributes as needed
  
      if @checkers.save
        redirect_to @checkers, notice: 'Checkers game was successfully created.'
      else
        flash[:alert] = "Failed to start the game."
        redirect_back(fallback_location: checkers_index_path)
      end
    else
      flash[:alert] = "Insufficient balance to start the game."
      redirect_back(fallback_location: checkers_index_path)
    end
  end

  def show
    @checkers = Checkers.find(params[:id])
    render layout: false
  end
  
  private
  
  def game_params
    params.require(:checkers).permit(:index)
  end

  def subtract_balance(amount)
    if @current_user.balance >= amount
      @current_user.update(balance: @current_user.balance - amount)
      logger.debug "Balance subtracted: #{@current_user.balance}"
    else
      flash[:alert] = "Insufficient balance to subtract #{amount} tokens."
      logger.debug "Insufficient balance: #{@current_user.balance}"
    end
  end
  
end
