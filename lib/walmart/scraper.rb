require 'uri'
require 'net/http'
require './lib/walmart/parser'

module Walmart
  class Scraper
    attr_reader :uri, :error

    def initialize(url)
      @uri = URI.parse(url)
    end

    def request_and_store
      return false unless valid_host?

      response = Net::HTTP.get_response(uri)
      parser = Walmart::Parser.new(response.body)

      return true
    end

    private

    def valid_host?
      uri.host == 'www.walmart.com'
    end
  end
end
