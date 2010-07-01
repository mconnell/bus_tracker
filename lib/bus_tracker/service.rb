module BusTracker
  class Service
    attr_accessor :number, :bus_stops

    def initialize(options = {})
      self.bus_stops = []

      options.each_pair do |option, value|
        self.send("#{option}=", value) if self.respond_to? "#{option}="
      end
    end
  end
end
