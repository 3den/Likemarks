module ApplicationHelper
  def set_title(value)
    title = "likemarks: #{value}"
    content_for(:title, title)
  end
end
