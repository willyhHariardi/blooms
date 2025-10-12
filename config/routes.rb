Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  devise_for  :admins, :path => 'admin/backyard',
        controllers: { registrations: "registrations" },
        :path_names => {
          :sign_in => "login",
          :sign_out => "logout",
        }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :carts do
    collection do
      post :checkout
    end
  end
  resources :products, only: [:index, :show]
  namespace :backyard do
    resources :category_products
    resources :products
    resources :orders, only: [:index, :show, :update]
  end
  resources :about, only: [:index, :show]
  resources :checkout, only: [:index, :show]
  resources :order, only: [:index, :show]

  root :to => "landing#index"

  get 'admin/backyard', to: "backyard/home#index", as: 'home_dashboard'
end
