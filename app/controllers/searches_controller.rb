class SearchesController < ApplicationController
  respond_to :html, :json

  def index
    username = params[:q].match(User::USERNAME_REGEX)[0] rescue nil
    query = params[:q].gsub(User::USERNAME_REGEX, "") rescue nil
    user = User.find_by_username(username) if username.present?
    scope =  user.present? ? user.links : Link

    @results = query.present? ?
      scope.search(query).page(params[:page]) :
      scope.page(params[:page])

    respond_with @results
  end

  def show
    @user = User.find(params[:id])
    params[:q] = "@#{@user.username}"
    Link.import_links_from @user
    @results = @user.links.page(params[:page])

    respond_with @results
  end

end
