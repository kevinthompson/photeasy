class ApplicationController < ActionController::Base
  before_filter :http_authenticate

  def authenticate_admin_user!
    redirect_to '/' and return if user_signed_in? && !current_user.is_admin?
    authenticate_user!
  end

  def current_admin_user
    return nil if user_signed_in? && !current_user.is_admin?
    current_user
  end

  private

  def http_authenticate
    if ENV['HTTP_AUTH'] && ENV['HTTP_USERNAME'] && ENV['HTTP_PASSWORD']
      authenticate_or_request_with_http_basic 'Staging' do |name, password|
        name == ENV['HTTP_USERNAME'] && password == ENV['HTTP_PASSWORD']
      end
    end
  end
end