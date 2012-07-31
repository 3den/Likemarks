module ApplicationHelper
  def set_title(value)
    title = value.present? ? "likemarks: #{value}" : "likemarks"
    content_for(:title, title)
  end

end
