require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require_relative 'lib/hostapd'

module Hostapd
  class Application < Sinatra::Base
    register Sinatra::Namespace

    configure :development do
      register Sinatra::Reloader
    end

    def service
      @service ||= Hostapd::Service.new
    end

    get '/' do
      @service = service

      haml :layout
    end

    post '/toggle' do
      service.active? ? service.stop! : service.start!

      redirect '/'
    end
  end
end

