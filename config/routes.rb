Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers
  patch "capture/:id", to: "pokemons#capture", as: "capture"
  patch "damage/:id", to: "pokemons#damage", as: "damage"
  get "pokemons/new", to: "pokemons#new", as: "pokemons"
  post "pokemons/new", to: "pokemons#create"
end
