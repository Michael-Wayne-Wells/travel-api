Rails.application.routes.draw do
  resources :locations do
    resources :reviews
  end
  get '/most_reviewed' => 'locations#most_reviewed'

  end
