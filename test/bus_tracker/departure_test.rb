require 'test_helper'

class BusTracker::DepartureTest < ActiveSupport::TestCase

  test "creating a new departure '30    MUSSELBURGH     11 '" do
    testee = BusTracker::Departure.new('30    MUSSELBURGH     11 ')

    assert_equal('30',testee.service_number)
    assert_equal('MUSSELBURGH', testee.destination)
    assert_equal('11', testee.due)
  end

  test "creating a new departure '30    MUSSELBURGH     DUE '" do
    testee = BusTracker::Departure.new('30    MUSSELBURGH     DUE ')

    assert_equal('30',testee.service_number)
    assert_equal('MUSSELBURGH', testee.destination)
    assert_equal('DUE', testee.due)
  end

  test "creating a new departure 'N30    MUSSELBURGH     *24 '" do
    testee = BusTracker::Departure.new('N30    MUSSELBURGH     *24 ')

    assert_equal('N30',testee.service_number)
    assert_equal('MUSSELBURGH', testee.destination)
    assert_equal('*24', testee.due)
  end

  test "creating a new departure 'N30    Queen Margret U     *12:45 '" do
    testee = BusTracker::Departure.new('N30    Queen Margret U     *12:45 ')

    assert_equal('N30',testee.service_number)
    assert_equal('Queen Margret U', testee.destination)
    assert_equal('*12:45', testee.due)
  end

  test "creating a new departure '4A  Service Diverted        '" do
    testee = BusTracker::Departure.new('4A  Service Diverted        ')

    assert_equal('4A', testee.service_number)
    assert_equal('Service Diverted', testee.destination)
    assert_equal(nil, testee.due)
  end
end
