require 'sinatra/base'
require './lib/walmart_scraper';

class ScraperApp < Sinatra::Base
  configure :production, :development do
    enable :logging
  end

  get '/' do
    erb :form
  end

  post '/' do
    scraper = WalmartScraper.new(params[:url])
    scraper.request_and_store!

    erb :result, locals: { message: scraper.message }
  end
end
