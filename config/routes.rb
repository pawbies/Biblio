Rails.application.routes.draw do
  get "reviews/new" => "reviews#new", as: :new_review
  post "reviews" => "reviews#create", as: :reviews
  delete "reviews/:id" => "reviews#destroy", as: :review

  get "borrows/:id/finish" => "borrows#finish", as: :finish_borrow
  patch "borrows/:id/finish" => "borrows#update_finish", as: :update_finish
  resources :reports, except: %i[ edit update ]
  resources :borrows
  resources :books
  resources :publishers
  resources :authors
  resources :categories
  resources :librarians

  get "archive" => "borrows#archive", as: :archive

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "pages#home"
  get "search" => "pages#search", as: :search

  get "login" => "sessions#login"
  post "logout" => "sessions#logout"
  post "login-verify" => "sessions#login_verify"


  get "imprint" => "pages#imprint"
  get "contact" => "pages#contact"
end
