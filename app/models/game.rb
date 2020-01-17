class Game < ApplicationRecord
  scope :available, -> { where(black_player_id: nill) }

  belongs_to: white_player,
    class_name: "User", 
    foreign_key: "id"

  belongs_to: black_player
    class_name: "User",
    foreign_key: "id"
    
end
