class LinksController < ApplicationController
  respond_to :html, :json

  def index
    @results = Likemarks::LinkSearch.new(self).links
    respond_with @results
  end

  def scope_for(username)
    user = User.find_by_username(username) if username.blank?
    user.present? ? user.links : Link
  end
end
