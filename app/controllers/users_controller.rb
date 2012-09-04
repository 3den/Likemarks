class UsersController < ApplicationController
  respond_to :html, :json

  def show
    params[:q] = "@#{params[:id]}"
    @results = Likemarks::LinkSearch.new(self).links

    respond_with @results
  end

  def scope_for(username)
    @user = User.find_by_username(username) or
      raise ActiveRecord::RecordNotFound

    @user.links
  end
end
