class PagesController < ApplicationController
  def terms
  end

  def home
    @results = Link.limit(10)
  end
end
