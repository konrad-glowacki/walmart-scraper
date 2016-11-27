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

  describe 'POST /' do
    it 'returns success and run scraper' do
      scraper = double('scraper')
      some_url = 'http://www.walmart.com/some-url'

      expect(WalmartScraper).to receive(:new).with(some_url).and_return(scraper)
      expect(scraper).to receive(:request_and_store!).once
      expect(scraper).to receive(:message).once.and_return('Some message')

      post '/', { url: some_url }

      expect(last_response.status).to eq 200
    end
  end
end