Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/dashboard', to: 'pages#dashboard'
  get '/kita-finder', to: 'pages#kita_finder'
  get '/kitas', to: 'pages#kitas'
  get '/lexicon', to: 'pages#lexicon'
  get '/midwife-system', to: 'pages#midwives'
  get '/paternity-acknowledgment', to: 'pages#paternity_acknowledgment'
  root to: 'pages#home'

  resources :kindergartens, only: [:index, :show] do
    resources :kita_contacts, only: [ :new, :create ]
    resources :kita_reminders, only: [:new, :create]
  end

  resources :kita_contacts, only: [:index, :update, :destroy]
  resources :kita_reminders, only: [:destroy]
end
