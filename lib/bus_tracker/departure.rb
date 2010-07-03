module BusTracker
  class Departure
    attr_accessor :service_number, :destination, :due

    def initialize(raw_string)
      set_attributes(raw_string)
    end

    private
    def set_attributes(raw_string)
      attributes = raw_string.split(/(\w*\d+\w*)\s*([a-z]+\s*(?!DUE)[a-z]*\s*(?!DUE)[a-z]+)\s+((DUE|\**[0-9:]*))\s*/i) - ['']
      self.service_number = attributes[0]
      self.destination    = attributes[1]
      self.due            = attributes[2]
    end
  end
end
