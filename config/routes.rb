Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch 'capture', to: "pokemons#capture"
  resources :pokemons
  patch 'damage', to: "pokemons#damage"
  get 'new_pokemon', to: "pokemons#new"
  post 'create_pokemon', to: "pokemons#create"
end
