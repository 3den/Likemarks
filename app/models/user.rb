class User < ActiveRecord::Base
  USERNAME_REGEX = /\@\w+/

  has_and_belongs_to_many :links
  attr_accessible :name, :username, :oauth_expires_at,
    :oauth_token, :provider, :uid
  validates :name, :oauth_token, presence: true


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.username = auth.info.nickname
      user.picture = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  # Get all non-facebook links shared by the user
  def fb_links(limit)
    facebook.links(limit)
  end

  def has_link?(link)
    links.find_by_link(link).present?
  end

  def facebook
    @facebook ||= Likemarks::Facebook.new oauth_token
  end
end
