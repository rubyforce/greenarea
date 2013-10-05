Greenarea::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => { :omniauth_callbacks => :omniauth_callbacks, :registrations => :"users/registrations", :passwords => :"users/passwords", :sessions => :"users/sessions" }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :subscriptions, only: :create

  resources :projects, only: [:index, :show] do
    resources :investments, only: [:new, :create]
  end

  get 'dashboard' => 'dashboard#index'
  get 'blog' => 'blog#index', as: :blog

  resources :users, only: :show

  devise_scope :user do
    put '/users/upload_images', to: 'users/registrations#upload_images'
  end

  resources :contacts, only: [:new, :create]

  resources :events

  mount GetVersion::Web => '/'
end

