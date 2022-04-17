Rails.application.routes.draw do
  root 'pages#home'
  get 'signup', to: 'users#new'

  get '', to: 'sessions#new'
  post '', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'tasks', to: 'tasks#change_title'
  patch 'remove_user', to: 'tasks#remove_user'

  resources :tasks
  resources :users
  get 'notifications', to: 'notifications#index'
end
