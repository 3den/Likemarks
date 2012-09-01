class PagesController < ApplicationController
  respond_to :json, :html

  def terms
  end

  def home
    @results = Link.limit(10)
    respond_with @results
  end
end
