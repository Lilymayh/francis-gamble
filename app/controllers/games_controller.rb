class GamesController < ApplicationController

	def show
		@user = current_user
		render layout: false
	end
end