Rails.application.routes.draw do
  devise_for :users
  get 'lectures/search'
  root 'lectures#index'
  resources :lectures, only:[:new,:create,:show,:edit,:update,:destroy] do
    resources :likes, only: [:create, :destroy]
  end
end
