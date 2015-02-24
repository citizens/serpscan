require 'rest_client'

module Serpscan
  class Account < SerpscanObject
    ATTRIBUTES = []
    attr_accessor *ATTRIBUTES
  end
end
