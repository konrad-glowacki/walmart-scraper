require 'uri'
require 'net/http'

require './models/product'
require './lib/walmart/uri_parser'
require './lib/walmart/document_parser'

module Walmart
  class Scraper
    attr_reader :uri, :error

    def initialize(url)
      @uri = URI.parse(url)
    end

    def request_and_store
      return false unless valid_host?

      response = Net::HTTP.get_response(uri)
      uri_parser = Walmart::UriParser.new(uri)
      document_parser = Walmart::DocumentParser.new(response.body)

      product = Product.new(
        name: document_parser.product_name, price: document_parser.product_price,
        url: uri.to_s, external_id: uri_parser.external_id
      )

      return product.save
    end

    private

    def valid_host?
      uri.host == 'www.walmart.com'
    end
  end
end
