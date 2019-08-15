Rails.application.routes.draw do
  # resources :order_foods
  # resources :foods
  # resources :chefs
  get '/available' => 'foods#available'
  post '/order' => 'order_foods#create'

require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
