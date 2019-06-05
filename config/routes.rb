Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'pages#home'
  get '/midwife-system', to: 'pages#midwives'
  get '/kitas', to: 'pages#kitas'
  get '/about', to: 'pages#about'
  root to: 'pages#home'

  resources :kindergartens, only: [:index, :show] do
    resources :kita_contacts, only: [ :new, :create ]
  end

  resources :kita_contacts, only: :index
end
