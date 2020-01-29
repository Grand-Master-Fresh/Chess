require 'rails_helper'

RSpec.describe PiecesController, type: :controller do

  describe "pieces#update action" do
    it "should updates coordinates if succesful move" do
      user1  = FactoryBot.create(:user, id: 1)
      user2 = FactoryBot.create(:user, id: 2)

      sign_in user2
      sign_in user1
      game = Game.create white_player_id: 1, black_player_id: 2
      game.pieces.delete_all
      black_king = FactoryBot.create(:king, x_position: 5, y_position: 1, user_id: 2, game_id: game.id, white: false)
      white_king = FactoryBot.create(:king, x_position: 5, y_position: 8, user_id: 1, game_id: game.id, white: true)
      pawn = FactoryBot.create(:pawn, x_position: 1, y_position: 6, user_id: 1, game_id: game.id, white: true)
      post :update, params: { id: pawn.id, pieces:{x_position: 1, y_position: 5}}
      expect(response).to have_http_status(200)
      pawn.reload
      expect(pawn.y_position).to eq 5
    end
  end
end
