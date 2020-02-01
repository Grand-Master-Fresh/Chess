class Game < ApplicationRecord
  scope :available, -> { where(black_player_id: nil) }

  has_many :user_games
  has_many :users, through: :user_games
  has_many :pieces


  after_create :populate_board!

  def populate_board!
  # Populates Pawns
    (0..7).each do |x|
    Pawn.create(x_position: x, y_position: 1, game_id: self.id, color: 'white')
    Pawn.create(x_position: x, y_position: 6, game_id: self.id, color: 'black')

     # Populate Rook 
    Rook.create(x_position: 0, y_position: 0, game_id: self.id, color: 'white')
    Rook.create(x_position: 7, y_position: 0, game_id: self.id, color: 'white')
    Rook.create(x_position: 0, y_position: 7, game_id: self.id, color: 'black')
    Rook.create(x_position: 7, y_position: 7, game_id: self.id, color: 'black')

     # Populate Knight 
    Knight.create(x_position: 1, y_position: 0, game_id: self.id, color: 'white')
    Knight.create(x_position: 6, y_position: 0, game_id: self.id, color: 'white')
    Knight.create(x_position: 1, y_position: 7, game_id: self.id, color: 'black')
    Knight.create(x_position: 6, y_position: 7, game_id: self.id, color: 'black')

     # Populate Bishop
    Bishop.create(x_position: 2, y_position: 0, game_id: self.id, color: 'white')
    Bishop.create(x_position: 5, y_position: 0, game_id: self.id, color: 'white')
    Bishop.create(x_position: 2, y_position: 7, game_id: self.id, color: 'black')
    Bishop.create(x_position: 5, y_position: 7, game_id: self.id, color: 'black')

     # Populate Queen 
    Queen.create(x_position: 3, y_position: 0, game_id: self.id, color: 'white')
    Queen.create(x_position: 3, y_position: 7, game_id: self.id, color: 'black')

    # Populate King
    King.create(x_position: 4, y_position: 0, game_id: self.id, color: 'white')
    King.create(x_position: 4, y_position: 7, game_id: self.id, color: 'black')

    end
    
  end
  
  
  
 end
