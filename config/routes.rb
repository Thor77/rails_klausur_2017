Rails.application.routes.draw do
  resources :databases
  resources :hosts
  resources :environments
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  root 'databases#index'
end
