class Link < ActiveRecord::Base
  has_and_belongs_to_many :users
  attr_accessible :created_time, :fid, :icon, :link, :message, :name, :picture
  validates :link, uniqueness: true

  def self.import_links_from(user)
    transaction do
      user.fb_links.each do |data|
        link = data["link"]
        next if user.has_link? link

        link_object = Link.find_or_initialize_by_link(link)
        if link_object.new_record?
          link_object.icon = data["icon"]
          link_object.message = data["message"]
          link_object.name = data["name"]
          link_object.picture = data["picture"]
          link_object.created_time = data["created_time"].to_time
          link_object.rank = 1
        else
          link_object.rank += 1
        end
        link_object.save

        user.links << link_object
      end
    end
  end

end
