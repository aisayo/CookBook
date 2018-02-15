Rails.application.routes.draw do

  devise_for :users
  root 'welcome#home'

  resources :recipes
  resources :ingredients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
