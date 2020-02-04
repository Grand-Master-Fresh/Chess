class PiecesController < ApplicationController
  def show
    @piece = Piece.find([params[:id])
    @pieces = @piece.game.pieces
    redirect_to controller: 'games', action: 'show', active_x: @piece.x_position, active_y: @piece.y_position

  end

  def update
    @piece = Piece.find([params[:id])
    @game = @piece.game

    if correct_turn?
      @piece.update_attributes(piece_params)
      redirect_to game_path(@game)
    else
      return render text: "Please wait for your turn", status: :forbidden
    end 
  end

  # def update
	# 	@piece = Piece.find(params[:id]) 
	# 	@game = @piece.game
  # 	@piece.update_attributes(x_position: params[:x_position], y_position: params[:y_position]) #move the pieces by passing in x,y position
  # 	redirect_to game_path(@game)  
  # end


  private

  def correct_turn?
    @game.turn_user_id == current_user.id
  end

  def piece_params
    params.require(:piece).permit(:x_position, :y_position)
  end

end
