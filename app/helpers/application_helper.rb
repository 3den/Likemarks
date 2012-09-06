module ApplicationHelper
  def set_title(value)
    title = "likemarks: #{value}"
    content_for(:title, title)
  end

  def manifest_attribute
    Rails.env.production? ?
      "manifest=\"#{appcache_path}\"".html_safe :
      ""
  end

  def current_path?(path)
    request.path == path
  end

  def active_class_for(path)
    current_path?(path) ?
      'class="active"'.html_safe :
      ""
  end

  def query
    html = []
    html << "@#{params[:username]}" if params[:username]
    html << params[:q] if params[:q]
    html.join " "
  end
end
