require 'nokogiri'
require 'open-uri'

require 'bus_tracker/service'
require 'bus_tracker/bus_stop'
require 'bus_tracker/departure'

module BusTracker

  BASE_URI = 'http://mybustracker.co.uk/'

  def self.service(number)
    service = BusTracker::Service.new(number)
    service.fetch_bus_stops!
    service
  end

  def self.bus_stop(code)
    bus_stop = BusTracker::BusStop.new(:code => code)
    bus_stop.fetch_departures!
    bus_stop
  end

end
