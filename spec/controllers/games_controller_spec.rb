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
  end

  it "should allow signed in users to create a new game in the database" do

  end



end
