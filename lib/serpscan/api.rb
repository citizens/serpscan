require 'rest_client'

module Serpscan
  class API
    BASE_URL = 'https://serpscan.com/api/v1'
    class << self
      def get(path, options = {})
        url = api_url(path)
        if options[:params]
          url += "&#{querify(options[:params])}"
        end

        normalize_response RestClient.get(url)
      end

      def delete(path)
        RestClient.delete(api_url(path))
      end

      def post(path, options = {})
        normalize_response RestClient.post(api_url(path), options[:params].to_json)
      end

      def put(path, options = {})
        normalize_response RestClient.put(api_url(path), options[:params].to_json, content_type: :json)
      end

      private

      def normalize_response(response)
        JSON.parse(response)
      end

      def api_url(path)
        "#{BASE_URL}#{tokenize(path)}"
      end

      def querify(hash)
        hash.map { |k, v| "#{k}=#{v}".to_s }.join('&')
      end

      def tokenize(path)
        param_separator = path.include?('?') ? '&' : '?'
        path += "#{param_separator}token=#{Serpscan.api_key}"
      end
    end
  end
end
