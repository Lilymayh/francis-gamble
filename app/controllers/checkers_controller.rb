class CheckersController < ApplicationController
  def show
    @game_board = GameBoard.new
  end
end