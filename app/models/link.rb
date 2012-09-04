class Link < ActiveRecord::Base
  include PgSearch

  attr_accessible :created_time, :fid, :icon, :link,
    :message, :name, :picture

  has_and_belongs_to_many :users
  validates :link, uniqueness: true

  default_scope order("rank DESC, created_time DESC")
  pg_search_scope :search,
    against: [:link, :name, :message],
    using: { tsearch: {prefix: true, dictionary: "simple"} }

  def self.import_links_from(user, limit=20)
    transaction do
      user.fb_links(limit).each do |data|
        link = data["link"].gsub(/\#.+/, "").gsub(/\/$/, "")
        next if user.has_link? link or link.size > 254

        link_object = Link.find_or_initialize_by_link(link)
        if link_object.new_record?
          link_object.load_data data
          link_object.rank = 1
        else
          link_object.rank += 1
        end

        link_object.save
        user.links << link_object
      end
    end
  end

  def load_data(data)
    self.message = data["message"] if data["message"]
    self.name = data["name"][0...255] if data["name"]
    self.created_time = data["created_time"] if data["created_time"]
    if data["picture"] and data["picture"].size < 256
      self.picture = data["picture"]
    end
  end
end
