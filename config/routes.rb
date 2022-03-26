Rails.application.routes.draw do
  get '/users/:id', to: 'users#show', as: 'user'
  devise_for :users
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
