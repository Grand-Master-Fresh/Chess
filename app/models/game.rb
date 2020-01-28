class Game < ApplicationRecord
  scope :available, -> { where(black_player_id: nil) }

  belongs_to :white_player
    

  belongs_to :black_player

  def populate_game
    create_piece('Rook', 'black', 0, 7)
    create_piece('Knight', 'black', 1, 7)
    create_piece('Bishop', 'black', 2, 7)
    create_piece('Queen', 'black', 3, 7)
    create_piece('King', 'black', 4, 7)
    create_piece('Bishop', 'black', 5, 7)
    create_piece('Knight', 'black', 6, 7)
    create_piece('Rook', 'black', 7, 7)
    create_piece('Rook', 'white', 0, 0)
    create_piece('Knight', 'white', 1, 0)
    create_piece('Bishop', 'white', 2, 0)
    create_piece('Queen', 'white', 3, 0)
    create_piece('King', 'white', 4, 0)
    create_piece('Bishop', 'white', 5, 0)
    create_piece('Knight', 'white', 6, 0)
    create_piece('Rook', 'white', 7, 0)
  end

  def place_black_pawns!
  end

  def place_white_pawns!
  end

  def create_piece(type, color, x_position, y_position)
  end

    
end
