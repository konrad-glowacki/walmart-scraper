require 'json'

module Walmart
  class Parser
    class UnknownDocument < ArgumentError; end

    attr_reader :data

    def initialize(content)
      document = Nokogiri::HTML(content)

      data_elem = document.css('script#tb-djs-wml-base').first
      raise UnknownDocument.new('Document has unrecognize structure') unless data_elem

      @data = JSON.parse(data_elem.text)
    end

    def product_name
      data['adContextJSON']['query']
    end

    def product_price
      data['adContextJSON']['price']
    end

    def product_item_id
      data['adContextJSON']['itemId']
    end
  end
end
