class SearchesController < ApplicationController
  respond_to :html, :json

  def index
    @results = Link.search(params[:q])
    respond_with @results
  end

  def show
    @user = User.find(params[:id])
    Link.import_links_from @user
    @results = @user.links

    respond_with @results
  end
end
