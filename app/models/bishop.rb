class Bishop < Piece
  def valid_move?(new_x_position, new_y_position)
    x_position = x_position(new_x_position)
    y_position = y_position(new_y_position)

    (x_position >= 1 && y_position >= 1) && (x_position == y_position)
  end
end
