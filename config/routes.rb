Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
end


# Rails.application.routes.draw do
#   devise_for :users, controllers: {registrations: 'users/registrations'}
#   root to: "registrations#index"
# end