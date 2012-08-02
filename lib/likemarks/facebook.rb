module Likemarks
  class Facebook
    attr_accessor :fb

    def initialize(oauth_token)
      @fb = Koala::Facebook::API.new(oauth_token)
    rescue Koala::Facebook::APIError => e
      logger.info e.to_s
      nil
    end

    def links(limit)
      links = fb.get_connection("me", "links?limit=#{limit}")
      links.select do |link|
        not link["link"].include? "facebook.com"
      end
    end

    private

    def links_query
      fql_query = 'SELECT picture, url, title, image_urls, created_time
      FROM link WHERE owner=me() AND "facebook" IN link.url'
    end
  end
end
