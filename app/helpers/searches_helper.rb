module SearchesHelper

  def link_to_users(users)
    users.limit(5).map do |user|
      link_to user.name, user_path(user.id)
    end.join(", ")
  end
end
