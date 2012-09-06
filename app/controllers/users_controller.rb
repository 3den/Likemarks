class UsersController < ApplicationController
  respond_to :html, :json

  def show
    @user = load_user(params[:id])
    respond_with @user
  end
end
