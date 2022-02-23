Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create edit update]
  resources :novels do
    resources :review, only: %i[create edit update destroy]
    resources :character, only: %i[create edit update destroy]
  end
end
