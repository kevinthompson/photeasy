require 'sidekiq/web'

Photeasy::Application.routes.draw do

  # Domain Constraints
  host_regex_pattern = Rails.env.production? ? /^photeasy\.com/ : /^(app\.)?photeasy\.(com|dev)/
  constraints lambda { |request| !(request.host =~ host_regex_pattern) } do
    root to: redirect { |params,request| "#{request.protocol}photeasy.#{request.domain.split('.').last}" }
    match '/*path', to: redirect { |params,request| "#{request.protocol}photeasy.#{request.domain.split('.').last}/#{params[:path]}" }
  end

  # Authentication
  if Rails.env.production?
    devise_for :users, skip: [:sessions, :registrations, :passwords, :omniauth_callbacks]
  else
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, path: ''
  end

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
            resources :albums
          end
          resources :albums, only: [:show]
        end
      end

      # Catch All for Single Page App
      match '*path' => 'pages#show', id: 'app', constraints: lambda { |request| request.format == :html }
    end

    # Photo Thumbnails
    resources :photos, only: [] do
      get :thumbnail
    end
  end

  # Index
  root to: 'pages#show', id: 'index'

  # Mailing List Subscriptions
  resources :subscriptions, only: [:create], constraints: { format: :json }

  # Catch All
  get '/:id' => 'pages#show', as: :static, via: :get

end