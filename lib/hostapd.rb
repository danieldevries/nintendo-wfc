require 'bundler'
Bundler.require(:default, ENV.fetch('RACK_ENV') { :development }.to_sym)

require_relative 'hostapd/service'
require_relative 'hostapd/config'
