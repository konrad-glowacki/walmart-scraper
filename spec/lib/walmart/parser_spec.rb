require 'spec_helper'

RSpec.describe Walmart::Parser do
  subject { described_class.new(content) }

  describe '#product_name' do
    context 'cannot find product name' do
      let(:content) { '<p>empty something</p>' }

      it 'returns nil' do
        expect(subject.product_name).to equal(nil)
      end
    end

    context 'can find product name' do
      let(:content) {
        '<h2 class="prod-ProductTitle no-margin heading-b" data-reactid=".0.1.1.1.0.0.1.1.5.0.0">
        <div data-reactid=".0.1.1.1.0.0.1.1.5.0.0.0">
        Ematic 9" Dual Screen Portable DVD Player with Dual DVD Players</div></h2>'
      }

      it 'returns string' do
        expect(subject.product_name).to eql('Ematic 9" Dual Screen Portable DVD Player with Dual DVD Players')
      end
    end
  end

  describe '#product_price' do
    context 'cannot find product price' do
      let(:content) { '<p>empty something</p>' }

      it 'returns nil' do
        expect(subject.product_price).to equal(nil)
      end
    end

    context 'can find product price' do
      let(:content) {
        '<span class="display-inline-block-xs prod-PaddingRight--s valign-top" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1"><div class="prod-PriceHero" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0"><span class="hide-content display-inline-block-m" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.0"><span class="display-inline-block arrange-fit Price Price--stylized u-textColor" data-tl-id="Price-ProductOffer" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.0.0"><span data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.0.0.0"><span class="Price-currency" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.0.0.0.0">$</span><span class="Price-characteristic" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.0.0.0.1">112</span><span class="Price-mark" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.0.0.0.2">.</span><span class="Price-mantissa" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.0.0.0.3">07</span></span></span></span><span class="hide-content-m" itemprop="" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.1"><span class="display-inline-block arrange-fit Price u-textColor" data-tl-id="Price-ProductOffer" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.1.0"><span data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.1.0.0"><span class="Price-currency" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.1.0.0.0">$</span><span class="Price-characteristic" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.1.0.0.1">112</span><span class="Price-mark" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.1.0.0.2">.</span><span class="Price-mantissa" data-reactid=".0.1.1.1.0.0.1.1.5.1.0.0.0.1.0.0.0.0.1.0.1.0.0.3">07</span></span></span></span></div></span>'
      }

      it 'returns float' do
        expect(subject.product_price).to eql(112.07)
      end
    end
  end

end
