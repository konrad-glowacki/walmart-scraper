module Walmart
  class UriParser
    attr_reader :uri

    def initialize(uri)
      @uri = uri
    end

    def external_id
      potential_id = uri.path.split('/').last
      potential_id =~ /^\d+$/ ? potential_id.to_i : nil
    end
  end
end
