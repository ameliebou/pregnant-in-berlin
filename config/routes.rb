Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'pages#home'
  get '/midwife-system', to: 'pages#midwives'
  get '/kita-finder', to: 'pages#kita_finder'
  get '/kitas', to: 'pages#kitas'
  get '/about', to: 'pages#about'
  get '/paternity-acknowledgment', to: 'pages#paternity_acknowledgment'
  root to: 'pages#home'

  resources :kindergartens, only: [:index, :show] do
    resources :kita_contacts, only: [ :new, :create ]
  end

  resources :kita_contacts, only: :index
end
