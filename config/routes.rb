Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch 'pokemons/:id', to: 'pokemons#capture', as:"capture"
  patch 'pokemons/:id', to: 'pokemons#damage', as:"damage"
  patch 'pokemons/:id', to: 'pokemons#destroy', as:"destroy"
  patch 'pokemons/:id', to: 'pokemons#create', as:"create"

end
