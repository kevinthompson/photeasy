Photeasy::Application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'index'

  # Authentication
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Administration
  ActiveAdmin.routes(self)
end
