class GamesController < ApplicationController

  def index
    @games = Game.available
  end

end
