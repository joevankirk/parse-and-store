Rails.application.routes.draw do
  root to: 'pages#new'
  post 'pages', to: 'pages#create'
  get 'list', to: 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
