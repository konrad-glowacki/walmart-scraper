require 'spec_helper'

RSpec.describe WalmartScraper do
  subject { described_class.new(url) }

  describe '#request_and_store' do
    context 'url is not from walmart' do
      let(:url) { 'http://some-other-url.com/other' }

      it 'returns false' do
        expect(subject.request_and_store).to equal(false)
      end
    end

    context 'url is from walmart' do
      let(:url) { 'http://www.walmart.com/ip/Ematic-9-Dual' }

      it 'returns true' do
        expect(subject.request_and_store).to equal(true)
      end
    end
  end
end
