class Checkers < ApplicationRecord
	has_one :game_board, dependent: :destroy
  after_create :initialize_game_board

  private

  def initialize_game_board
    create_game_board unless game_board
    # Initialize squares or any other necessary setup
  end
end