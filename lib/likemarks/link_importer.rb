module Likemarks
  class LinkImporter
    attr_reader :user, :data

    def self.import_from(user, limit=20)
      user.fb_links(limit).each do |data|
        new(user, data).save
      end
    end

    def initialize(user, data)
      @user = user
      @data = data
    end

    def save
      return false unless valid?

      link = Link.find_or_initialize_by_link(url)
      link.load_data data
      user.links << link
    end

    def valid?
      data["link"].present? and
        data["name"].present? and
        url.size < 255 and
        !user.has_link?(url)
    end

    private

    def url
      @url ||= data["link"].gsub(/\#.+/, "").gsub(/\/$/, "")
    end

  end
end
