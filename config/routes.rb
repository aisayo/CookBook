Rails.application.routes.draw do

  #devise_for :users
  root 'welcome#home'

  resources :recipes do
    resources :ingredients, only: [:show, :index, :destroy]
  end

  resources :ingredients, only: [:show, :index, :destroy]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
