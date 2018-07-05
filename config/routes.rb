Rails.application.routes.draw do
  devise_for :investors
  devise_for :traders
  devise_for :admins

  post 'auth_trader' => 'authentication#authenticate_trader'
  namespace :api do
    namespace :v1 do
      resources :ideas
    end
  end

  root 'ideas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
