Rails.application.routes.draw do

  resources :courses
  resources :users
  resources :sessions
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :evaluations
  root 'evaluations#index'

  post 'users/favorites_delete'
  post 'users/favorites_add'

end