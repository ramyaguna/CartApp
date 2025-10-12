Rails.application.routes.draw do
  devise_for :users
  # resources  :carts
  resources  :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'categories#index'

  # scope module: 'admin' do
    resources :categories, shallow: true do
      resources :sub_categories do 
        resources :products do
          collection do
              get :load_subcategory
          end
          # member  do 
          #   post :add_to_cart
          # end
        end
      end
    end
  # end

  resources :orders
  resources :carts

  # post '/products/:id/add_to_cart', to: 'products#add_to_cart', as: :add_to_cart


  # resources :products do
  #   post :add_to_cart, on: :member
  # end
  resource :cart, only: [:new]
  resources :order_items, only: [:create, :destroy]
  

   resources :order_items do
    collection do
      get :find_total
    end
  end
end
