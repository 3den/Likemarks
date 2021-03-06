class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def load_user(username)
    if username.blank?
      nil
    elsif %w{me eu myself}.include? username.downcase
      current_user
    else
      User.find_by_username(username)
    end
  end
end
