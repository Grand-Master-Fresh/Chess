# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'games#index'
  resources :games
  resources :pieces, :only => [:update, :show, :create]
end
