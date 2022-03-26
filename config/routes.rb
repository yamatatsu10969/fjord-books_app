Rails.application.routes.draw do
  devise_for :users
  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
