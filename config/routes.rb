Rails.application.routes.draw do
  devise_for :users
  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  resources :books
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

