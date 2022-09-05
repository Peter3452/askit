Rails.application.routes.draw do
  get 'users/create'
  get 'users/new'
  get 'pages/index'

  resources :users

  resources :questions do 
    resources :answers
  end

  root 'pages#index'
end
