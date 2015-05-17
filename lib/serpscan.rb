require 'serpscan/version'
require 'serpscan/api'
require 'serpscan/utilities'
require 'serpscan/serpscan_object'
require 'serpscan/serpscan_child_object'
require 'serpscan/keyword'
require 'serpscan/search_engine'
require 'serpscan/search_engine_country'
require 'serpscan/website'
require 'serpscan/errors'
require 'queryparams'
require 'json'

module Serpscan
  class << self
    def api_key
      @api_key || ENV['SERPSCAN_API_KEY']
    end

    def api_key=(key)
      @api_key = key
    end
  end
end
