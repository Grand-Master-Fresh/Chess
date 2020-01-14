class Game < ApplicationRecord
  
  belongs_to: white_player,
    class_name: "User", 
    foreign_key: "id"

  belongs_to: black_player
    class_name: "User",
    foreign_key: "id"
    
end
