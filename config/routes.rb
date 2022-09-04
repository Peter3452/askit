Rails.application.routes.draw do
  get 'answers/create'
  get 'pages/index'
  resources :questions

  root 'pages#index'
end
