Rails.application.routes.draw do
  devise_for :users
  root 'lectures#index'
  resources :lectures, only:[:new, :create,:show]
end
