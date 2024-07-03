class CheckersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:start]

  def index
    @games = Checkers.all
    render layout: false
  end

  def start
    amount = params[:checkers][:amount].to_i

    if @current_user.balance >= amount
      # Deduct balance before starting the game
      @current_user.update(balance: @current_user.balance - amount)

      # Logic to start the game and initialize @checkers
      @checkers = Checkers.create!  # Replace with your logic for creating a new game
      @checkers.update(board: Array.new(64, nil), bet_amount: amount)

      redirect_to checkers_show_path(@checkers)
    else
      flash[:alert] = "Insufficient balance to start the game."
      redirect_back(fallback_location: checkers_index_path)
    end
  end

  def show
    @checkers = Checkers.find(params[:id])
    @checkers.board = JSON.parse(@checkers.board) if @checkers.board.is_a?(String)
    render layout: false
  end
end
