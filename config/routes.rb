Rails.application.routes.draw do
  resources :databases
  resources :hosts
  resources :environments
  resources :users
  root 'databases#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
