Rails.application.routes.draw do
  resources :achievements, only: [ :new, :create, :show ]
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
