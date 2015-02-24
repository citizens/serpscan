module Serpscan
  class SerpscanChildObject < SerpscanObject
    attr_accessor :parent

    def initialize(options = {})
      @parent = options[:parent]
      super
    end

    class << self
      def all(params = {})
        params.merge!(parent: params[:parent], child: self)
        super
      end

      def create(params = {})
        object = self.new(params)
        params.merge!("#{object.parent.object_name}_id" => object.parent.id) if object.parent
        super
      end
    end
  end
end

