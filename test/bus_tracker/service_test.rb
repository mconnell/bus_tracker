require 'test_helper'

class BusTracker::ServiceTest < ActiveSupport::TestCase

  test "instanciating a new service should have an empty array of bus stops" do
    testee = BusTracker::Service.new
    assert(testee.bus_stops.is_a?(Array))
    assert_equal(0, testee.bus_stops.size)
  end

end
