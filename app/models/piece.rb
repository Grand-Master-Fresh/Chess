class Piece < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :game, optional: true
  has_many :user
end