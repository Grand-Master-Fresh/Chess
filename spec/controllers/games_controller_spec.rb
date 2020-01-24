require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#create" do

   it "should require users to be logged in" do
     game = FactoryBot.create(:game)
     post :create
     expect(response).to redirect_to new_user_session_path
   end

   it "should allow signed in users to create a new game in the database" do
    user = FactoryBot.create(:user, id: 1)
    sign_in user
    post :create, params:{game:{white_player_user_id: 1,black_player_id:7}}
    game = Game.last
    expect(game.black_player_id).to eq 7

   end

  end

  describe "games#update" do

    it "should redirect users who have not signed in to sign in" do
      game = FactoryBot.create(:game)
      patch :update, params: {id: game.id}
      expect(response).to redirect_to new_user_session_path
    end

    it "should allow signed in users to join unmatched games, piece user_id to be updated by the joining player id" do
     user1 = FactoryBot.create(:user, id:1)
     user2 = FactoryBot.create(:user, id:2)
     sign_in user1

     post :create, params:{game:{white_player_user_id: user1.id}}
     game = Game.last
     sign_out user1
     sign_in user2
     patch :update, params:{id: game.id, game:{black_player_id: user2.id}}
     game.reload
     expect(game.black_player_id).to eq user2.id
     expect(response).to redirect_to game_path(game)
   end



    # it "should change the current game's black_player_id to the currently logged in user" do
    #   user = FactoryBot.create(:user)
    #   sign_in user
    #   game = FactoryBot.create(:game, :black_player_id => user.id)
    #
    #   put :update, params: { id: game.id, }
    #
    #   @game.black_player_id.should eq(current_user)
    # end
    #

  end



end
