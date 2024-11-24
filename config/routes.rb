Rails.application.routes.draw do
  get "borrows/:id/finish" => "borrows#finish", as: :finish_borrow
  resources :borrows
  resources :books
  resources :publishers
  resources :authors
  resources :categories
  resources :librarians

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "pages#home"

  get "login" => "sessions#login"
  post "logout" => "sessions#logout"
  post "login-verify" => "sessions#login_verify"
end
