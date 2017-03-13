Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tables#new'
  resources :users
  resources :tables
  get 'reservations' => 'reservations#index'
  get 'reservations/booked' => 'reservations#booked'
end
