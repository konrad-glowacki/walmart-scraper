class WalmartScraper
  attr_reader :error

  def initialize(url)
    @url = url
  end

  def request_and_store
    return false unless valid_url?
    return true
  end

  private

  def valid_url?
    /https?:\/\/www.walmart.com\/.+/.match(@url) != nil
  end
end
