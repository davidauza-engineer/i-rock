Rails.application.routes.draw do
  devise_for :users
  resources :achievements do
    resources :encouragements, only: [:new, :create]
  end

  namespace :api do
    resources :achievements, only: [:index]
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
