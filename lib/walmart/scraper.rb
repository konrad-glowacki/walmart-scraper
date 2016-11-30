require 'uri'
require 'net/http'

require './models/product'
require './lib/walmart/parser'

module Walmart
  class Scraper
    attr_reader :uri, :error, :product

    def initialize(url)
      @uri = URI.parse(url)
    end

    def request_and_store
      return false unless valid_host?

      response = Net::HTTP.get_response(uri)
      parser = Walmart::Parser.new(response.body)

      @product = Product.new(
        name: parser.product_name, price: parser.product_price,
        item_id: parser.product_item_id
      )

      product.save
    end

    def error
      product.errors.full_messages
    end

    private

    def valid_host?
      uri.host == 'www.walmart.com'
    end
  end
end
