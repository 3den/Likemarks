module ApplicationHelper
  def set_title(value)
    title = "likemarks: #{value}"
    content_for(:title, title)
  end

  def manifest_attribute
    "manifest=\"#{appcache_path}\"".html_safe
  end

  def current_path?(path)
    request.path == path
  end

  def active_class_for(path)
    current_path?(path) ?
      'class="active"'.html_safe :
      ""
  end
end
