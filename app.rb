require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require_relative 'lib/hostapd'

module Hostapd
  class Application < Sinatra::Base
    register Sinatra::Namespace

    configure :development do
      register Sinatra::Reloader
    end

    def hostapd_config_path
      ENV.fetch('HOSTAPD_CONFIG') { Hostapd::Config::PATH }
    end

    get '/' do
      @service = Hostapd::Service.new
      @config = Hostapd::Config.new(hostapd_config_path)

      erb :layout
    end

    post '/toggle' do
      @service = Hostapd::Service.new
      @service.active? ? @service.stop! : @service.start!

      redirect '/'
    end
  end
end
