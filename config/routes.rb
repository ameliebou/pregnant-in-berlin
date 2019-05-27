Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'pages#home'
  get '/kitas', to: 'pages#kitas'
  root to: 'pages#home'

  resources :kindergartens, only: [:index, :show] do
    resources :kita_contacts, only: [ :new, :create ]
  end

  resources :kita_contacts, only: :index
end
