require 'sidekiq/web'

Photeasy::Application.routes.draw do

  # App
  constraints subdomain: 'app' do

    # Index
    root to: 'pages#show', id: 'app'

    # Administration
    ActiveAdmin.routes(self)

    # Background Jobs
    admin_user = lambda { |request| request.env['warden'].authenticate? and request.env['warden'].user.is_admin? }
    constraints admin_user do
      mount Sidekiq::Web => '/sidekiq'
    end

    # Authentication
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    devise_scope :user do
      get '/sign_in' => 'devise/sessions#new'
      get '/sign_out' => 'devise/sessions#destroy'
    end

    # API
    namespace :api, format: true, constraints: { format: :json } do
      namespace :v1 do
        resources :photos, only: [:index]
        resources :users, only: [:show] do
          resources :collections
        end
        resources :collections, only: [:show]
      end
    end
  end

  # Index
  root to: 'pages#show', id: 'index'

  # Photo Thumbnails
  resources :photos, only: [] do
    get :thumbnail
  end

  # Catch All
  match '*path' => 'pages#show', id: 'index', constraints: lambda { |request| !(request.path =~ /^\/assets/) }

end
