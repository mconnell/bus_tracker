module BusTracker
  class Service
    attr_accessor :number, :bus_stops

    def initialize(number)
      self.number    = number
      self.bus_stops = []
    end

    def fetch_bus_stops!
      self.bus_stops = []

      document  = Nokogiri::HTML(open("#{BASE_URI}getServicePoints.php?serviceMnemo=#{self.number}"))
      bus_stops = document.xpath('//map/markers/busstop')
      bus_stops.each do |bus_stop|
        code             = bus_stop.xpath('sms')[0].content
        name             = bus_stop.xpath('nom')[0].content
        latitude         = bus_stop.xpath('x')[0].content
        longitude        = bus_stop.xpath('y')[0].content
        service_numbers  = bus_stop.xpath('services/service/mnemo').map {|s| s.content}

        self.bus_stops << BusTracker::BusStop.new(
          :code      => code,
          :name      => name,
          :latitude  => latitude,
          :longitude => longitude,
          :service_numbers => service_numbers
        )
      end
    end
  end
end
