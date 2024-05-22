class PagesController < ApplicationController
  def checkers
    # Action for displaying the checkers game page
    render layout: false
  end

  def home
    # Action for displaying the home page
  end

  def tictactoe
    # Action for displaying the tic-tac-toe page without layout
    render layout: false
  end

  def games
		render layout: false
	end
end

