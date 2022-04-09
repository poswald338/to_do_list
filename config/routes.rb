Rails.application.routes.draw do
  root 'pages#home'
  get 'signup', to: 'users#new'

  get '', to: 'sessions#new'
  post '', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :tasks
  resources :users
end
