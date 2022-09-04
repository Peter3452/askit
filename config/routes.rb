Rails.application.routes.draw do
  get 'pages/index'
  resources :questions

  root 'pages#index'
end
