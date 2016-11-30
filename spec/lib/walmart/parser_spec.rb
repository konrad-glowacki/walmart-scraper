require 'spec_helper'

RSpec.describe Walmart::Parser do
  context 'Found data in script tag' do
    let(:content) {
      '<script id=tb-djs-wml-base type="application/json">{
        "logmonToptxId": "1a50007b-181fc-158b77b77c1000",
        "analyticsPCTX": null,
        "adContextJSON": {"query":"Ematic 9\" Dual Screen Portable DVD Player with Dual DVD Players (ED929D)","manufacturer":"Ematic","brand":"Ematic","itemId":"28806789","price":112.07,"online":true,"freeShipping":false,"inStore":false,"preorder":false,"categoryPathName":"Home Page/Electronics/TV & Video/Portable DVD Players","categoryPathId":"0:3944:1060825:62056","pageType":"item","subType":"item"},
        "device": "UNSPECIFIED",
        "locale": "en-US",
        "isMobileWeb": false,
        "isMobileApp": false,
        "tenant": "WALMART_US",
        "voltageKeyUrl": "",
        "currentCartEnabled": false,
        "isIos": false,
        "shippingPassEnabled": true,
        "shippingPassDetailsUrl": "http://www.walmart.com/cp/3472216",
        "shippingPassSignUpUrl": "/checkout/shipping-pass",
        "shippingPassDetailsLinkText": "See details",
        "shippingPassSignUpLinkText": "Sign up",
        "shippingPassUpsellMessageOne": "Get a year of unlimited",
        "shippingPassUpsellMessageTwo": "2-day",
        "shippingPassUpsellMessageThree": "shipping for",
        "shippingPassUpsellMessageFour": "$49",
        "pageIsResponsive": true,
        "useShipMethodDefaultRule": true,
        "hidePacCCBanner": false,
        "showCCBannerHolidayAmount": false,
        "showPercentageCCBanner": true,
        "wmccLimit": "50.0",
        "wmccPercentage": "0.15",
        "holidayNames": {"188":"Christmas","187":"Veterans Day"},
        "wpaEnabled": false,
        "wpaCalled": false,
        "tlt": false,
        "isHolidayEmailSignup": false,
        "athConfig": {"MMType":"SingleItem","BEACON_SELECTORS":[".js-onehg-module-pov",".js-corner-ad",".js-category-carousel-curated",".js-item-carousel-curated",".js-single-item",".js-pov",".js-module-p13n-recommendations",".js-main-element",".js-ath-slick-carousel-fully-responsive"],"PGID":"itempage","USE_AJAX":false,"WHITELISTED_MODULES":["NONE"],"TIMEOUT":700,"ATHENA_ENDPOINT":"/athp"},
        "isAniviaLoggingEnabled":  false,
        "elevateFreePickup": false,
        "pacReservedItemMessage": true
      }</script>'
    }

    subject { described_class.new(content) }

    describe '#product_name' do
      it 'Returns proper name' do
        expect(subject.product_name).to eql('Ematic 9" Dual Screen Portable DVD Player with Dual DVD Players (ED929D)')
      end
    end

    describe '#product_name' do
      it 'Returns proper price' do
        expect(subject.product_price).to eql(112.07)
      end
    end
  end

  context 'Not found data in script tag' do
    let(:content) { '<p>empty something</p>' }

    describe '#new' do
      it 'Raises an UnknownDocument error' do
        expect { described_class.new(content) }.to raise_error(Walmart::Parser::UnknownDocument)
      end
    end
  end
end
