class GamesController < ApplicationController

	def new_game
	end

	def create_game
		case params[:game_type]
		when "checkers"
			redirect_to #new checkers game
		#root to tictactoe
	end
end