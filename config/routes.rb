Rails.application.routes.draw do

  devise_for :users
  root 'static#landing'

end
