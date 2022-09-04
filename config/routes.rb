Rails.application.routes.draw do
  get 'pages/index'

  resources :questions do 
    resources :answers
  end

  root 'pages#index'
end
