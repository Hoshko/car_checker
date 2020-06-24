Rails.application.routes.draw do
  resources :questions
  resources :reviews
  resources :car_models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :car_models, only: [:index, :show]

  telegram_webhook TelegramController

  root to: "reviews#index"
end
