Rails.application.routes.draw do
  resources :locations do
    resources :reviews
  end
end
