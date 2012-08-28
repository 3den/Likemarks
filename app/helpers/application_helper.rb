module ApplicationHelper
  def set_title(value)
    title = "likemarks: #{value}"
    content_for(:title, title)
  end

  def manifest_attribute
    Rails.env.production? || true ?
      'manifest="/production.appcache"'.html_safe :
      ""
  end
end
