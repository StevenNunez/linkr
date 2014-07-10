Rails.application.routes.draw do
  root 'home#index'
  resources :short_links
  resources :sessions, only: [:new, :create]
  resources :registrations, only: [:create]
  delete '/signout' => 'sessions#destroy'
  get '/:short_code' => 'short_links#show'
end
