class User < ActiveRecord::Base
  has_and_belongs_to_many :links
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid

  validates :name, :oauth_token, presence: true


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  # Get all non-facebook links shared by the user
  #u.facebook.fql_query 'SELECT picture, url, title, image_urls, created_time FROM link WHERE owner=me() AND "facebook" IN link.url'
  def fb_links
    links = facebook.get_connection("me", "links")
    links.select do |link|
      not link["link"].include? "facebook"
    end
  end

  def has_link?(link)
    links.find_by_link(link).present?
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil
  end
end
