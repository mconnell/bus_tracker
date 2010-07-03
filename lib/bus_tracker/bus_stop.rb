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
  end
end
