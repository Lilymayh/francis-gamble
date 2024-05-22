class TictactoeController < ApplicationController

  def index

    @games = Tictactoe.all

    render layout: false

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



  private



  def game_params

    params.require(:tictactoe).permit(:index)

  end

end



  def check_game_over

    # Add logic to check if game is over

  end
