require 'spec_helper'

RSpec.describe Walmart::Scraper do
  subject { described_class.new(url) }

  describe '#request_and_store' do
    context 'url is not from walmart' do
      let(:url) { 'http://some-other-url.com/other' }

      it 'returns false' do
        expect(subject.request_and_store).to equal(false)
      end
    end

    context 'url is from walmart', vcr: true do
      let(:url) { 'https://www.walmart.com/ip/Ematic-9-Dual-Screen-Portable-DVD-Player-with-Dual-DVD-Players-ED929D/28806789' }

      it 'returns true' do
        VCR.use_cassette('walmart-ematic-dual-screen') do
          expect(subject.request_and_store).to equal(true)
        end
      end
    end
  end
end
