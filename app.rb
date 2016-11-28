require 'sinatra/base'
require './lib/walmart/scraper';

class ScraperApp < Sinatra::Base
  configure :production, :development do
    enable :logging
  end

  get '/' do
    erb :form
  end

  post '/' do
    scraper = Walmart::Scraper.new(params[:url])

    if scraper.request_and_store
      erb :success
    else
      erb :error, locals: { message: scraper.error }
    end
  end
end
