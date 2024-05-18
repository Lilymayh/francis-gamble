class CheckersController < ApplicationController
  def show
    @game_board = GameBoard.new
    render layout: false
  end
end