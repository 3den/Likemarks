class ImportController < ApplicationController

  def create
    unless current_user
      render json: {error: "user"}, status: :forbidden
    end

    Link.import_links_from current_user
    render json: current_user.links
  end
end
