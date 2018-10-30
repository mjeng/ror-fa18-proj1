Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers
  patch "capture/:id", to: "pokemons#capture", as: "capture"
end
