require 'sidekiq/web'

Photeasy::Application.routes.draw do

  # Authentication
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, path: ''

  if !Rails.env.production?
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

      # Catch All for Single Page App
      match '*path' => 'pages#show', id: 'index', constraints: lambda { |request| request.format == :html }
    end
  end

  # Index
  root to: 'pages#show', id: 'index'

  # Mailing List Subscriptions
  resources :subscriptions, only: [:create], constraints: { format: :json }

  # Photo Thumbnails
  resources :photos, only: [] do
    get :thumbnail
  end

  # Catch All
  get '/:id' => 'pages#show', as: :static, via: :get

end