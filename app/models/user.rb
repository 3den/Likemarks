class User < ActiveRecord::Base
  has_and_belongs_to_many :links
  validates :name, :username, :oauth_token, presence: true
  validates :username, uniqueness: true

  def self.from_omniauth(auth)
    where(
      auth.slice(:provider, :uid)
    ).first_or_initialize.tap do |user|
      user.load_auth auth
      user.save!
    end
  end

  def load_auth(auth)
    self.provider = auth.provider
    self.uid = auth.uid
    self.name = auth.info.name
    self.picture = auth.info.image
    self.oauth_token = auth.credentials.token
    self.oauth_expires_at = Time.at(auth.credentials.expires_at)
    self.username = auth.info.nickname.present? ?
      auth.info.nickname.gsub(".", "") :
      "#{name.gsub(/\W/, "")}_#{uid}"
  end

  def fb_links(limit)
    facebook.links(limit)
  end

  def has_link?(link)
    links.find_by_link(link).present?
  end

  def to_param
    username
  end

  private

  def facebook
    @facebook ||= Likemarks::Facebook.new oauth_token
  end
end
