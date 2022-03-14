Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :tasks, only: [:show, :index]
end
