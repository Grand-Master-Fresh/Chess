class Game < ApplicationRecord
  scope :available, -> { where(black_player_id: nil) }

  has_many :user_games
  has_many :users, through: :user_games
  has_many :pieces


  after_create :populate_board!

  # def populate_board!
  #   # Populates Pawns
  #   (0..7).each do |x|
  #     Pawn.create(x_position: x, y_position: 1, game_id: self.id, color: 'white')
  #     Pawn.create(x_position: x, y_position: 1, game_id: self.id, color: 'black')

  #   # Populate Rook 
  #     Rook.create(x_position: 0, y_position: 0, game_id: self.id, color: 'white')
  #     Rook.create(x_position: 7, y_position: 0, game_id: self.id, color: 'white')
  #     Rook.create(x_position: 0, y_position: 7, game_id: self.id, color: 'black')
  #     Rook.create(x_position: 7, y_position: 7, game_id: self.id, color: 'black')

  #   # Populate Knight 
  #     Knight.create(x_position: 1, y_position: 0, game_id: self.id, color: 'white')
  #     Knight.create(x_position: 6, y_position: 0, game_id: self.id, color: 'white')
  #     Knight.create(x_position: 1, y_position: 7, game_id: self.id, color: 'black')
  #     Knight.create(x_position: 6, y_position: 7, game_id: self.id, color: 'black')

  #   # Populate Bishop
  #     Bishop.create(x_position: 2, y_position: 0, game_id: self.id, color: 'white')
  #     Bishop.create(x_position: 5, y_position: 0, game_id: self.id, color: 'white')
  #     Bishop.create(x_position: 2, y_position: 7, game_id: self.id, color: 'black')
  #     Bishop.create(x_position: 5, y_position: 7, game_id: self.id, color: 'black')

  #   # Populate Queen 
  #     Queen.create(x_position: 3, y_position: 0, game_id: self.id, color: 'white')
  #     Queen.create(x_position: 3, y_position: 7, game_id: self.id, color: 'black')

  #   # Populate King
  #     King.create(x_position: 4, y_position: 0, game_id: self.id, color: 'white')
  #     King.create(x_position: 4, y_position: 0, game_id: self.id, color: 'black')

  #   end
    
  # end
  
  
  
  # will comment this out at the moment until our next meeting since its making 4 test fail.
  # belongs_to :black_player

  def populate!
    place_black_left_half!
    place_black_right_half!
    place_black_pawns!
    place_white_pawns!
    place_white_left_half!
    place_white_right_half!
  end

  def place_black_left_half!
    create_piece('Rook', 'black', 0, 7)
    create_piece('Knight', 'black', 1, 7)
    create_piece('Bishop', 'black', 2, 7)
    create_piece('Queen', 'black', 3, 7)
  end

  def place_black_right_half!
    create_piece('King', 'black', 4, 7)
    create_piece('Bishop', 'black', 5, 7)
    create_piece('Knight', 'black', 6, 7)
    create_piece('Rook', 'black', 7, 7)
  end

  def place_black_pawns!
  end

  def place_white_pawns!
  end

  def place_white_left_half!
    create_piece('Rook', 'white', 0, 0)
    create_piece('Knight', 'white', 1, 0)
    create_piece('Bishop', 'white', 2, 0)
    create_piece9('Queen', 'white', 3, 0)
  end

  def place_white_right_half!
    create_piece('King', 'white', 4, 0)
    create_piece('Bishop', 'white', 5, 0)
    create_piece('Knight', 'white', 6, 0)
    create_piece('Rook', 'white', 7, 0)
  end

  def create_piece(type, color, x_position, y_position)
    #something here
  end

  private

  def piece_params
  	params.require(:piece).permit(:x_position, :y_position)
  end

end
