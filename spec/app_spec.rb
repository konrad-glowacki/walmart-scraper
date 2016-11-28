require 'spec_helper'

RSpec.describe ScraperApp do
  def app
    ScraperApp
  end

  describe 'GET /' do
    it 'returns success' do
      get '/'
      expect(last_response.status).to eq 200
    end
  end

  describe 'POST /', vcr: true do
    it 'run scraper and returns success' do
      scraper = double('scraper')
      some_url = 'https://www.walmart.com/some-url'

      expect(Walmart::Scraper).to receive(:new).with(some_url).and_return(scraper)
      expect(scraper).to receive(:request_and_store).once.and_return(true)

      post '/', { url: some_url }

      expect(last_response.status).to eq 200
    end
  end
end
