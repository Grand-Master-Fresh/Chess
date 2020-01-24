class GamesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :update]

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
      @game = Game.find_by_id(params[:id])
      @game.class.where(user_id:nil).update_all(user_id: current_user.id)

      @game.update_attributes(game_params)
      @game.users << current_user
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
