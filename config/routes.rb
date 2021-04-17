Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :users, only: :show
  resources :messages do
    resources :comments, only: :create
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
  end
end

