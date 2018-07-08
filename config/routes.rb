Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :pictures
  devise_for :investors
  devise_for :traders
  devise_for :admins

  post 'auth_trader' => 'authentication#authenticate_trader'
  namespace :api do
    namespace :v1 do
      match '/traders',   to: 'traders#index',   via: 'get'
      resources :ideas
    end
  end

  root 'ideas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
