class GamesController < ApplicationController

  def index
    @games = Game.available
  end

  def create
    @game = Game.new
  end

end
