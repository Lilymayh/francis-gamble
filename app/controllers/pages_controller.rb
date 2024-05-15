class PagesController < ApplicationController
  def home

  end

  def tictactoe
    render layout: false
  end
end