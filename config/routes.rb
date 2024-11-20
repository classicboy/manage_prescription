Rails.application.routes.draw do
  devise_for :doctors

  get "up" => "rails/health#show", as: :rails_health_check

  # root "prescriptions#index"

  # resources :patients, only: %i[index show new create edit update]
  # resources :prescriptions

  # namespace :admin do
  #   resources :doctors
  #   resources :patients
  #   resources :prescriptions
  # end
end
