class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.by_id(session[:user_id])
  end

  def signed_in?
    !current_user.nil?
  end

  helper_method :current_user, :signed_in?
end
