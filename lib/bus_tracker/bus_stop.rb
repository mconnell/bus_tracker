module BusTracker
  class BusStop
    attr_accessor :latitude, :longitude, :service_numbers

    def initialize(options = {})
      self.service_numbers = []

      options.each_pair do |option, value|
        self.send("#{option}=", value) if self.respond_to? "#{option}="
      end
    end
  end
end
