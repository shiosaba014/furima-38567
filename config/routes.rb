Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users
  root to:'items#index'
  resources :items do
    collection do
      get 'search'
      get 'search2'
    end
    resources :consumers, only:[:create,:index]
  end
  resources :users, only: [:show,:update]
  resources :cards, only: [:new, :create]
end
