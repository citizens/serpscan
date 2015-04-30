module Serpscan
  class SerpscanObject
    def initialize(options = {})
      @raw_json ||= options
      assign_attributes(options)
    end

    def api_path
      SerpscanObject.api_path(self)
    end

    def object_name
      Serpscan::Utilities.object_to_string(self)
    end

    def delete
      Serpscan::API.delete("#{api_path}/#{id}")
      true
    end

    def to_json
      @raw_json.to_json
    end

    class << self
      def api_path(object = self)
        "/#{Serpscan::Utilities.object_to_string(object)}s"
      end

      def all(options = {})
        parent = options[:parent]
        child = options[:child]
        objects = options.fetch(:objects, [])

        url = options[:parent] ? "#{parent.api_path}/#{parent.id}#{child.api_path}" : api_path
        results = Serpscan::API.get(url, params: options[:params])

        results['results'].map do |object|
          objects << new(object.merge(parent: options[:parent]))
        end

        consider_pagination(results, options, objects)
        objects
      end

      def find(id)
        results = Serpscan::API.get("#{api_path}/#{id}")
        new(results)
      end

      def create(params)
        parent_object = params.delete(:parent)
        params = { Serpscan::Utilities.object_to_string(self) => params }
        results = Serpscan::API.post("#{api_path}?#{QueryParams.encode(params)}", params: params)
        new(results.merge(parent: parent_object))
      end

      def consider_pagination(results, options, objects)
        if results['page'] && results['page'].to_i < results['total_pages']
          (options[:child]).all(options.merge(objects: objects, params: { page: results['page'].to_i + 1 }))
        end
      end
    end

    private

    def assign_attributes(options = {})
      self.class::ATTRIBUTES.each do |attribute|
        send("#{attribute}=", options[attribute.to_s])
      end
    end
  end
end
