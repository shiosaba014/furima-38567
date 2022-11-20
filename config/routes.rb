Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  resources :items do
    collection do
      get 'search'
      get 'search2'
    end
    resources :consumers, only:[:create,:index]
  end
end
