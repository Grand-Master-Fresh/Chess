class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]

  def index
    @games = Game.all
  end

  def show
    unless game.present?
      return redirect_to dashboard_path
    end
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
    @game.update_attributes(black_player_id: current_user.id)
    redirect_to game_path(@game)
  end

  private

  def game
    @game ||= Game.where(id: params[:id]).last
  end

  def game_params
    params.require(:game).permit(
      :name,
      :state,
      :white_player_id,
      :black_player_id)
  end


end
