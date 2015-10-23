module Serpscan
  class SearchEngineCountry < SerpscanChildObject
    ATTRIBUTES = [:id, :location, :search_engine_id, :default, :local]
    attr_accessor *ATTRIBUTES

    def search_engine
      parent
    end

    def save(params = {})
      super(params)
    end

    class << self
      def create
        params = { Serpscan::Utilities.object_to_string(self) => params }
        API.post("#{api_path}?#{QueryParams.encode(params)}", params: params, json: true)
      end
    end
  end
end
