module Serpscan
  class SearchEngine < SerpscanObject
    ATTRIBUTES = [:id, :title]
    attr_accessor *ATTRIBUTES

    def countries
      @countries ||= @raw_json["countries"].map { |country| Serpscan::SearchEngineCountry.new(country.merge(parent: self)) }
    end
  end
end