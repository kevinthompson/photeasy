require 'sidekiq/web'

Photeasy::Application.routes.draw do
  # Index
  root to: 'high_voltage/pages#show', id: 'index'

  # Background Jobs
  admin_user = lambda { |request| request.env['warden'].authenticate? and request.env['warden'].user.is_admin? }
  constraints admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end

  # Authentication
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
    get '/sign_in' => 'devise/sessions#new'
    get '/sign_out' => 'devise/sessions#destroy'
  end

  # Administration
  ActiveAdmin.routes(self)

  # API
  namespace :api, format: true, constraints: { format: :json } do
    namespace :v1 do
      resources :photos, only: [:index]
      resources :users, only: [:show]
    end
  end

  # Catch All
  match '*path' => 'high_voltage/pages#show', id: 'index', constraints: lambda { |request| !(request.path =~ /^\/assets/) }
end
