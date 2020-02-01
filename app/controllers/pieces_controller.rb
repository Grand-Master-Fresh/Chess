class PiecesController < ApplicationController
  def show 
    @piece = Piece.find(params[:id])
    @pieces = @piece.game.pieces
    # redirect_to controller: 'games', action: 'update'
  end 

  def update
		@piece = Piece.find(params[:id]) 
		@game = @piece.game
  	@piece.update_attributes(x_position: params[:x_position], y_position: params[:y_position]) #move the pieces by passing in x,y position
  	redirect_to game_path(@game)  
  end


  private

  def correct_turn?
    @game.turn_user_id == current_user.id
  end

  def piece_params
    params.require(:piece).permit(:x_position, :y_position)
  end

end
