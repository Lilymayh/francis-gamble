class TictactoeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:start]

  def index
    @games = Tictactoe.all
    render layout: false
  end

  def start
    amount = params[:tictactoe][:amount].to_i
    board = JSON.parse(params[:tictactoe][:board])  # Parse the board string into an array
    if @current_user.balance >= amount
      # Deduct balance before starting the game
      subtract_balance(amount)
      flash[:notice] = "#{amount} tokens have been subtracted from your balance."
      
      # Logic to start the game and initialize @tictactoe
      @tictactoe = Tictactoe.new(board: board)  # Pass the parsed board array
      @tictactoe.bet_amount = amount
      if @tictactoe.save
        redirect_to tictactoe_show_path(@tictactoe)
      else
        flash[:alert] = "Failed to start the game."
        redirect_back(fallback_location: tictactoe_index_path)
      end
    else
      flash[:alert] = "Insufficient balance to start the game."
      redirect_back(fallback_location: tictactoe_index_path)
    end
  end

  def show
    @tictactoe = Tictactoe.find(params[:id])

    # Ensure board is an array
    @tictactoe.board = JSON.parse(@tictactoe.board) if @tictactoe.board.is_a?(String)

    render layout: false
  end

  def new
    @tictactoe = Tictactoe.new
    render layout: false
  end

  def create
    @tictactoe = Tictactoe.new(board: Array.new(9, nil), current_turn: 'X')
    if @tictactoe.save
      redirect_to tictactoe_path(@tictactoe)
    else
      render :new
    end
  end

  def update
    @game = Tictactoe.find(params[:id])
    index = game_params[:index].to_i

    if @game.make_player_move(index)
      render json: @game
    else
      render json: { error: 'Invalid move or game over' }, status: :unprocessable_entity
    end
  end

  def check_game_over
    # Add logic to check if game is over
  end

  private

  def game_params
    params.require(:tictactoe).permit(:index)
  end

  def subtract_balance(amount)
    if @current_user.balance >= amount
      @current_user.update(balance: @current_user.balance - amount)
    else
      flash[:alert] = "Insufficient balance to subtract #{amount} tokens."
    end
  end
end
