class ChessPiece < ApplicationRecord

# This method checks whether a piece is present at (x, y).
  
  def occupied?(x, y)
    game.pieces.where(x_coordinates: x, y_coordinates: y).present?
  end

# Checks path and defines it, if possible (Knight is the exception).  

  def check_path(x1, y1, x2, y2)
    if y1 == y2
      return 'horizontal'
    elsif x1 == x2
      return 'vertical'
    else
      # Move diagonally.
      @slope = (y2 - y1).to_f / (x2 - x1).to_f
    end
  end

# Method to determine whether the path between selected piece and destination is obstructed by another piece (Knight will be exception to the rule).

  def is_obstructed?(destination_x, destination_y)
    @game = game
    # Converts the location into easier-to-read x and y terms
    x1 = self.x_coordinates #assume starting points
    y1 = self.y_coordinates
    x2 = destination[0]
    y2 = destination[1]
    # Determines whether the line between Piece 1 and the destination is horizontal or
    # vertical. If neither, then it calculates the slope of line between Piece 1 and destination.
    path = check_path(x1, y1, x2, y2)
    # Checking if path is horizontal and right to left.
    if path == 'horizontal' && x1 < x2
      (x1 + 1).upto(x2 - 1) do |x|
        return true if occupied?(x, y1)
      end
    end
    # Checking if path is horizontal and left to right.
    if path == 'horizontal' && x1 > x2
      (x1 - 1).downto(x2 + 1) do |x|
        return true if occupied?(x, y1)
      end
    end
    # Checking if path is vertical and downward.
    if path == 'vertical' && y1 < y2
      (y1 + 1).upto(y2 - 1) do |y|
        return true if occupied?(x1, y)
      end
    end
    # Checking if path is vertical and upward.
    if path == 'vertical' && y1 > y2
      (y1 - 1).downto(y2 + 1) do |y|
        return true if occupied?(x1, y)
      end
    end
    if path == 'horizontal' || path == 'vertical'
      return false
    end
    # Checking if path is diagonal and downward.
    if @slope.abs == 1.0 && x1 < x2
      (x1 + 1).upto(x2 - 1) do |x|
        delta_y = x - x1
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if occupied?(x, y)
      end
    end
    # Checking if path is diagonal and upward.
    if @slope.abs == 1.0 && x1 > x2
      (x1 - 1).downto(x2 + 1) do |x|
        delta_y = x1 - x
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if occupied?(x, y)
      end
    end
    # Path not a straight line?
    if @slope.abs != 1.0
      fail 'path is not a straight line'
    else return false
    end
  end 

# Method for capturing a piece.

# If the intended target destination has a piece that is from the opposing player, that piece will be removed from the board.

# Will return a fail if the target destination is occupied by your own piece.

  def move_to!(new_x, new_y)
    @game = game
    if occupied?(new_x, new_y)
      @piece_at_destination = @game.pieces.find_by(x_coordinates: new_x, y_coordinates: new_y)
      if color == @piece_at_destination.color
        fail 'destination occupied by piece of same color'
      else
        @piece_at_destination.update_attributes(x_coordinates: nil, y_coordinates: nil, status: 'captured')
        @status = @piece_at_destination.status
        @captured = true
      end
    else @captured = false
    end
  end 
  
end
