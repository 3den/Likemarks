class PagesController < ApplicationController
  def terms
  end

  def home
    @results = Likemarks::LinkSearch.new(self).links
  end

  def scope_for(username)
    Link.limit(10)
  end
end
