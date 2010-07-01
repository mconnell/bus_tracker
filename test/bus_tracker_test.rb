require 'test_helper'

class BusTrackerTest < ActiveSupport::TestCase

  test "requesting a service should return the service with associated bus stops" do
    testee = BusTracker.service('30')

    assert(testee.is_a?(BusTracker::Service), "Not returning a Service object")
    testee.bus_stops.each do |bus_stop|
      assert(bus_stop.is_a?(BusTracker::BusStop), "bus stop isn't a BusTracler::BusStop instance")
      assert(bus_stop.service_numbers.include?(testee.number), "Service numbers do not include #{testee.number}")
      assert_equal(String, bus_stop.name.class)
      assert_equal(String, bus_stop.code.class)
    end
  end

end
