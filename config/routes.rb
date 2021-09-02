Rails.application.routes.draw do
    devise_for :users
    root to: "products#index"
    resources :products, only: [:new, :create, :show]

    get 'products/index'
    post'products/create'
    get 'users/index'
    get 'products/show'
end