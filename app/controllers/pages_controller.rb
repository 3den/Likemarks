class PagesController < ApplicationController
  respond_to :json, :html

  def terms
  end

  def home
    @results = Likemarks::LinkSearch.new(self).links
    respond_with @results
  end

  def scope_for(username)
    Link.limit(10)
  end
end
