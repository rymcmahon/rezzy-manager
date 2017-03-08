Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :tables
  get 'reservations' => 'reservations#index'
  get 'reservations/booked' => 'reservations#booked'
  get 'users/:id' => 'users#show'
end
