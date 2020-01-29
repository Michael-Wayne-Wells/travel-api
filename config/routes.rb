Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :locations do
    resources :reviews
  end
  get '/most_reviewed' => 'locations#most_reviewed'

  end
