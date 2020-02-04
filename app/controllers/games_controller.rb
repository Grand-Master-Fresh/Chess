class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]
  helper_method :game
  
  def index
    @games = Game.all
  end

  def show
   @game = Game.find(params[:id])
   @pieces = @game.pieces
   @black_player = User.find_by(id: @game.black_player_id)
   @white_player = User.find_by(id: @game.white_player_id)
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
