module Walmart
  class Parser
    attr_reader :document

    def initialize(content)
      @document = Nokogiri::HTML(content)
    end
  end
end
