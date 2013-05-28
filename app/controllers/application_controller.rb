class ApplicationController < ActionController::Base
  def authenticate_admin_user!
    redirect_to '/' and return if user_signed_in? && !current_user.is_admin?
    authenticate_user!
  end

  def current_admin_user
    return nil if user_signed_in? && !current_user.is_admin?
    current_user
  end
end