module SearchesHelper
  def link_to_users(users)
    users.limit(5).map do |user|
      link_to user.name, user_path(user)
    end.join(", ")
  end

  def picture_for picture, options={}
    picture =~ /^http/ ?
      image_tag(picture, options) :
      ""
  end
end
