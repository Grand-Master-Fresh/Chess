class Game < ApplicationRecord
  scope :available, -> { where(black_player_id: nil) }

  belongs_to :white_player
    

  belongs_to :black_player
  
    
end
