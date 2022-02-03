Rails.application.routes.draw do
  resources :quacks

  root to: 'main#index'
  get 'login', to: 'sessions#new', as: :main_index
  post 'login', to: 'sessions#create'
  get 'signup', to: 'registrations#new'
  post 'signup', to: 'registrations#create'
  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'
  delete 'logout', to: 'sessions#destroy'

end
