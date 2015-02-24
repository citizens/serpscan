module Serpscan
  class Utilities
    class << self
      def object_to_string(object)
        object_name = object.is_a?(Class) ? object.name : object.class
        underscore(object_name.to_s.split('::').last).downcase
      end

      def underscore(string)
        string.gsub(/::/, '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-', '_')
          .downcase
      end
    end
  end
end
