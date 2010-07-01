require 'nokogiri'
require 'open-uri'

require 'bus_tracker/service'
require 'bus_tracker/bus_stop'

module BusTracker

  BASE_URI = 'http://mybustracker.co.uk/'

  def self.service(number)
    service = BusTracker::Service.new(:number => number)

    document  = Nokogiri::HTML(open("#{BASE_URI}getServicePoints.php?serviceMnemo=#{number}"))
    bus_stops = document.xpath('//map/markers/busstop')
    bus_stops.each do |bus_stop|
      code             = bus_stop.xpath('sms')[0].content
      name             = bus_stop.xpath('nom')[0].content
      latitude         = bus_stop.xpath('x')[0].content
      longitude        = bus_stop.xpath('y')[0].content
      service_numbers  = bus_stop.xpath('services/service/mnemo').map {|s| s.content}

      service.bus_stops << BusTracker::BusStop.new(
        :code      => code,
        :name      => name,
        :latitude  => latitude,
        :longitude => longitude,
        :service_numbers => service_numbers
      )
    end

    service
  end

end
