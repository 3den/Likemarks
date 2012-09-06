class SessionsController < ApplicationController
  respond_to :html, :json

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    Link.import_links_from user
    session[:user_id] = user.id

    respond_to do |format|
      format.html { redirect_to user_path(user) }
      format.json { render json: user }
    end
  end

  def destroy
    session[:user_id] = nil

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { render json: {}, status: :ok }
    end
  end
end
