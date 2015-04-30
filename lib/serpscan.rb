require 'serpscan/version'
require 'serpscan/api'
require 'serpscan/utilities'
require 'serpscan/serpscan_object'
require 'serpscan/serpscan_child_object'
require 'serpscan/keyword'
require 'serpscan/search_engine'
require 'serpscan/website'
require 'serpscan/errors'
require 'queryparams'
require 'json'

module Serpscan
  class << self
    attr_accessor :api_key
  end
end
