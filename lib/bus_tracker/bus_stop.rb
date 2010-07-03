module BusTracker
  class BusStop
    attr_accessor :name, :code, :latitude, :longitude, :service_numbers, :departures

    def initialize(options = {})
      self.service_numbers = []
      self.departures      = []

      options.each_pair do |option, value|
        self.send("#{option}=", value) if self.respond_to? "#{option}="
      end
    end

    def fetch_departures!
      self.departures = []

      uri  = "#{BASE_URI}getBusStopDepartures.php?refreshCount=0&clientType=b&busStopCode=#{code}"
      uri += "&busStopDay=0&busStopService=0&numberOfPassage=4&busStopTime=&busStopDestination=0"
      document = Nokogiri::HTML(open(uri))
      document.xpath('//pre').each do |departure|
        self.departures << BusTracker::Departure.new(departure.content)
      end
    end
  end
end
