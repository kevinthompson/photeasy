Photeasy::Application.routes.draw do
  # Index
  root to: 'high_voltage/pages#show', id: 'index'

  # Authentication
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Administration
  ActiveAdmin.routes(self)

  # API
  namespace :api, format: true, constraints: { format: :json } do
    namespace :v1 do
      resources :users
    end
  end

  # Catch All
  match '*path' => 'high_voltage/pages#show', id: 'index'
end