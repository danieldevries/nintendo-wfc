module Hostapd
  class Config
    KEYS = %i[ssid].freeze
    PATH = '/etc/hostapd/hostapd.conf'.freeze

    attr_reader :config

    def initialize(path = PATH)
      @config = File.read(path).split("\n").map do |line|
        line.split('=')
      end.to_h.select { |k,v| KEYS.include?(k.to_sym) }
    end

    KEYS.each do |key|
      define_method(key) do
        config[key.to_s]
      end
    end
  end
end
