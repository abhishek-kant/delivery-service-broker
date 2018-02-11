Rails.application.routes.draw do
  resources :delivery_offices
  root to: "delivery_offices#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
