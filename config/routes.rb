Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'pages#home'
  root to: 'pages#home'

  resources :kindergartens, only: [:index, :show]
end
