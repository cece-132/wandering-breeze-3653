Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects, only: [:show]
  resources :contestants, only: [:index]
  resources :contestant_projects, only: [:create]
end
