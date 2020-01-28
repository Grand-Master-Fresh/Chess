module GamesHelper

  def piece_at(x_position, y_position)
    piece = Piece.where(x_position: x_position, y_position: y_position).first

    return piece.type.to_s unless piece.nil?
    ''
  end

end
