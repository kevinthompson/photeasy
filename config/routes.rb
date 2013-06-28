require 'sidekiq/web'

Photeasy::Application.routes.draw do

  # Domain Constraints
  host_regex_pattern = Rails.env.production? ? /^photeasy\.com/ : /^(app\.)?(staging\.)?photeasy\.(com|dev)/
  constraints lambda { |request| !(request.host =~ host_regex_pattern) } do
    root to: redirect { |params,request| "#{request.protocol}photeasy.#{request.domain.split('.').last}" }
    match '/*path', to: redirect { |params,request| "#{request.protocol}photeasy.#{request.domain.split('.').last}/#{params[:path]}" }
  end

  # Docs
  mount Raddocs::App => '/docs', anchor: false if Rails.env.development?

  # Authentication
  if Rails.env.production?
    devise_for :users, skip: [:sessions, :registrations, :passwords, :omniauth_callbacks]
  else
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, path: ''
  end

  if !Rails.env.production?
    # App
    constraints lambda { |request| request.host =~ /^app\./ } do

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
          resources :albums, except: [:edit, :new]
          resources :orders, only: [:create]
          resources :shares, only: [:show]
          resources :users, only: [:show], contraints: { id: 'current' }
        end
      end

      # Shares
      get '/shares/:uuid', constraints: { uuid: /[\d\w-]{36}/ }, controller: :pages, action: :show, id: 'app', as: :share

      # Catch All for Single Page App
      match '*path' => 'pages#show', id: 'app', constraints: lambda { |request| request.format == :html }
    end

    # Photo Thumbnails
    resources :photos, only: [] do
      get :thumbnail
    end

    # Albums
    resources :albums, only: [:show]
  end

  # Index
  root to: 'pages#show', id: 'index'

  # Mailing List Subscriptions
  resources :subscriptions, only: [:create], constraints: { format: :json }

  # Catch All
  get '/:id' => 'pages#show', as: :static, via: :get

end