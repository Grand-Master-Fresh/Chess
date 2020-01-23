class GamesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    redirect_to game_path(@game)
  end

  def update
   @game = Game.find(params[:id])
   @game.update_attributes(:black_player_id => current_user.id)
   redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(
      :name,
      :state,
      :white_player_id,
      :black_player_id)
  end


end
