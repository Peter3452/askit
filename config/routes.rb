Rails.application.routes.draw do
  resources :sessions

  get 'pages/index'

  resources :users

  resources :questions do 
    resources :answers
  end

  root 'pages#index'
end
