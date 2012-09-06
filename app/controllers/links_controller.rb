class LinksController < ApplicationController
  respond_to :html, :json

  def index
    @results = Likemarks::LinkSearch.new(self).links
    respond_with @results
  end

  def scope_for(username)
    user = load_user(username)
    user.present? ? user.links : Link
  end
end
