module Hostapd
  class Service
    UNIT = 'hostapd.service'.freeze
    INTERFACE = DBus::Systemd::Unit::INTERFACE

    def initialize
      @unit = DBus::Systemd::Unit.new(UNIT)
    end

    def start!
      @unit.Start('fail')
    end

    def stop!
      @unit.Stop('fail')
    end

    def properties
      @unit.GetAll(INTERFACE).first
    end

    def status
      @unit.Get(INTERFACE, 'ActiveState').first
    end

    def active?
      status == 'active'
    end
  end
end
