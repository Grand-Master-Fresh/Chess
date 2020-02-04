module GamesHelper

  def piece_at(x_position, y_position)
    piece = Piece.where(x_position: x_position, y_position: y_position).first

    return piece.type.to_s unless piece.nil?
    ''
  end
  def populate_board!
    # Populates Pawns
    (0..7).each do |x|
      Pawn.create(x_position: x, y_position: 1, game_id: self.id, color: 'white')
      Pawn.create(x_position: x, y_position: 1, game_id: self.id, color: 'black')

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
      King.create(x_position: 4, y_position: 0, game_id: self.id, color: 'black')

    end

    populate_board!

end
end