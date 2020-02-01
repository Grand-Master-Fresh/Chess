class Piece < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :game, optional: true
  has_many :user

  def occupied?(x, y)
    game.pieces.where(x_position: x, y_position: y).present?
  end

  def is_obstructed?(destination_x, destination_y)
    @game = game
    # Converts the location into easier-to-read x and y terms
    x1 = self.x_position #assume starting points
    y1 = self.y_position
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

  def move_to!(new_x, new_y)
    @game = game
    if occupied?(new_x, new_y)
      @piece_at_destination = @game.pieces.find_by(x_position: new_x, y_position: new_y)
      if color == @piece_at_destination.color
        fail 'destination occupied by piece of same color'
      else
        @piece_at_destination.update_attributes(x_position: nil, y_position: nil, status: 'captured')
        @status = @piece_at_destination.status
        @captured = true
      end
    else @captured = false
    end
  end









  private

  def piece_params
  	params.require(:piece).permit(:x_position, :y_position)
  end
































end