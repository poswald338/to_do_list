Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  get 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :tasks
  resources :users
end
