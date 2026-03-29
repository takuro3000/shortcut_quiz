Rails.application.routes.draw do
  root 'home#index'

  resources :quizzes, only: %i[show]
  resources :home, only: %i[index]

  get 'up' => 'rails/health#show', as: :rails_health_check
end
