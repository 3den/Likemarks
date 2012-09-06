class Link < ActiveRecord::Base
  include PgSearch

  attr_accessible :created_time, :fid, :icon, :link,
    :message, :name, :picture

  has_and_belongs_to_many :users
  validates :name, :link, presence: true
  validates :link, uniqueness: true

  default_scope order("rank DESC, created_time DESC")
  pg_search_scope :search,
    against: [:link, :name, :message],
    using: { tsearch: {prefix: true, dictionary: "simple"} }

  def self.import_links_from(user, limit=20)
    transaction do
      Likemarks::LinkImporter.import_from(user, limit)
    end
  end

  def load_data(data)
    self.message = data["message"] if data["message"]
    self.name = data["name"][0...255] if data["name"]
    self.created_time = data["created_time"] if data["created_time"]
    self.rank += 1

    if data["picture"] and data["picture"].size < 256
      self.picture = data["picture"]
    end

    save
  end
end
