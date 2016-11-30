require 'spec_helper'

RSpec.describe Walmart::UriParser do
  subject { described_class.new(uri) }

  describe '#external_id' do
    context 'completely different url' do
      let(:uri) { URI.parse('http://some-other-url.com/other') }

      it { expect(subject.external_id).to equal(nil) }
    end

    context 'url with external_id' do
      let(:uri) { URI.parse('https://www.walmart.com/ip/Ematic-9-Dual-Screen-Portable-DVD-Player-with-Dual-DVD-Players-ED929D/28806789') }

      it { expect(subject.external_id).to equal(28806789) }
    end
  end
end
