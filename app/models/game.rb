class Game < ApplicationRecord
  scope :available, -> { where(black_player_id: nil) }

  has_many :user_games
  has_many :users, through: :user_games
  has_many :pieces


end
