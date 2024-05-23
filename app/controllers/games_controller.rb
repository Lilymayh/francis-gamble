class GamesController < ApplicationController

	def show
		@current_user = current_user
		render layout: false
	end
end