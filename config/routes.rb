Rails.application.routes.draw do
    devise_for :users
    root to: "products#index"
    resources :products, only: [:new, :create]

    get 'products/index'
    post'products/create'
    get 'users/index'
    get 'products', to:'products#index'
end