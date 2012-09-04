class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    Link.import_links_from user
    session[:user_id] = user.id
    cookies[:user] = user.to_json
    redirect_to user_path(user)
  end

  def destroy
    cookies[:user] = session[:user_id] = nil
    redirect_to root_url
  end
end
