Rails.application.routes.draw do
  resources :memes
  get '/home/index'
  # get '/home/about'
  get '/home/memes'
  get '/home/services'
  get '/home/contact'
  get '/memes/new'

  root to: 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
