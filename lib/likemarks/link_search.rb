module Likemarks
  class LinkSearch
    USERNAME_REGEX = /(?<=\@)[\w\.]+/
    attr_accessor :delegator

    # LinkSearch.new
    #
    # delegator - should respond to: params, scope_for
    def initialize(delegator)
      @delegator = delegator
    end

    def links
      query.present? ? scope.search(query) : scope
    end

    def username
      @username ||= params[:q].match(USERNAME_REGEX)[0] rescue nil
    end

    private

    def params
      delegator.params
    end

    def query
      params[:q].gsub("@#{username}", "") rescue nil
    end

    def scope
      @scope ||= delegator.
        scope_for(username).
        page(params[:page]).
        per(params[:limit] || 20)
    end
  end
end
