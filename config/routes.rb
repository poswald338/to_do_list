Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :tasks
  resources :users
end
