Rails.application.routes.draw do
  resources :markers
  resources :categories
  resources :types
  get 'api_json', to: 'categories#api_json'
  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
