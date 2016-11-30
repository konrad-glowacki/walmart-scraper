module Walmart
  class DocumentParser
    attr_reader :document

    def initialize(content)
      @document = Nokogiri::HTML(content)
    end

    def product_name
      elem = document.css('h2.prod-ProductTitle').first
      elem ? elem.text.strip : nil
    end

    def product_price
      parent = document.css('div.prod-PriceHero').first
      return nil unless parent

      decimal = parent.css('span.Price-characteristic').first.text.to_f
      rest = parent.css('span.Price-mantissa').first.text.to_f / 100

      return decimal + rest
    end
  end
end
