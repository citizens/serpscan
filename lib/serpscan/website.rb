require 'rest_client'

module Serpscan
  class Website < SerpscanObject
    ATTRIBUTES = [:id, :url]
    attr_accessor *ATTRIBUTES

    def create_keyword(phrase)
      keyword = Serpscan::Keyword.create(parent: self, phrase: phrase)
    end

    def keywords
      @keywords ||= Serpscan::Keyword.all(parent: self)
    end
  end
end
