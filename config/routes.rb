Rails.application.routes.draw do
  devise_for :users
  root to: redirect('/home', status: 302)
  get 'home', to: 'pages#home', as: 'home'
  get 'create_an_account', to: 'pages#create_an_account', as:'create_an_account'
  post 'create_an_account', to: 'pages#create_account', as: 'create_account'
  get 'select_character', to: 'pages#select_character', as: 'select_character'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
