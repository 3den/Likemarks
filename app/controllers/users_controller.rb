class UsersController < ApplicationController
  respond_to :html, :json

  def show
    @user = User.find(params[:id])
    params[:q] = "@#{@user.username}"
    Link.import_links_from @user
    @results = @user.links.page(params[:page])

    respond_with @results
  end
end
