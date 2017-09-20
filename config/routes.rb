Rails.application.routes.draw do
  devise_for :users
  mount Beknown::Engine, at: "/admin"

  get 'search', to: 'posts#search', as: :search
  get '/:slug', to: 'posts#show', as: :post

  root to: 'posts#index'
end
