Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :events
  resources :participations, only: %i[new create destroy]

  root "events#index"
end
