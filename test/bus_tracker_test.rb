require 'test_helper'

class BusTrackerTest < ActiveSupport::TestCase

  test "requesting a service should return the service with associated bus stops" do
    testee = BusTracker.service('30')

    assert(testee.is_a?(BusTracker::Service), "Not returning a Service object")
    testee.bus_stops.each do |bus_stop|
      assert(bus_stop.service_numbers.include?(testee.number), "Service numbers do not include #{testee.number}")
    end
  end

  test "requesting a bus stop should return a collection of the bus stop's departures" do
    testee = BusTracker.bus_stop('36232545')

    testee.departures.each do |departure|
      assert_equal(BusTracker::Departure, departure.class)
      assert_equal('30', departure.service_number)
    end
  end

end
