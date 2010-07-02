require 'test_helper'

class BusTracker::BusStopTest < ActiveSupport::TestCase

  def setup
    service = BusTracker.service('30')
    @testee = service.bus_stops.first
  end

  test "testee should be an instance of BusStop" do
    assert(@testee.is_a?(BusTracker::BusStop), "Object is not a BusStop")
  end

  test "testee bus stop should have a code" do
    assert_equal('36232545', @testee.code)
  end

  test "Bus Stop code is a string" do
    assert_equal(String, @testee.code.class)
  end

  test "testee bus stop should have a name" do
    assert_equal('Castle Street', @testee.name)
  end

  test "Bus Stop name is a string" do
    assert_equal(String, @testee.name.class)
  end

  test "testee bus stop should have an array of the all the service numbers that stop at it" do
    assert_equal(Array, @testee.service_numbers.class)

    assert_equal(
      ["1","3","3A","4","22","25","X25","30","33","34","44","44A","N22","N25","N30","N44"],
      @testee.service_numbers
    )
  end
end
