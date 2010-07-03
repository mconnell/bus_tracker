# Bustracker

Edinburgh BusTracker via Ruby.

An attempt at providing an object-based interface for interacting with the BusTracker data.

# Installation

    gem install bus_tracker

# Examples

## Service Information
Find all of the bus stops for a particular service:
    service = BusTracker.service('N30')
    
    service.number
    #=> 'N30'

After fetching a service, you can also pull up information about each stop for that service:

    bus_stop = service.bus_stops.first
    
    bus_stop.code
    > '36232545'
    
    bus_stop.name
     > 'Castle Street'
    
    bus_stop.latitude
     > "55.951084136963"
    bus_stop.longitude
     > "-3.2017660140991"
    
    bus_stop.service_numbers
     > ["1", "3", "3A", "4", "22", "25", "X25", "30", "33", "34", "44", "44A", "N22", "N25", "N30", "N44"]

## Departures
If you know the code for a bus stop you can fetch the associated departures. This is the same information that
you'd see on the bus tracker boards, but instantiated as their own departure objects.
    stop = BusTracker.bus_stop('36232545')
    departure = stop.departures.first
    
    departure.service_number
    #=> 30
    departure.destination
    #=> MUSSELBURGH
    departure.due
    #=> 7

For any BusTracker::BusStop instance, you can fetch the latest departure times:
    stop.fetch_departures!
    stop.departures.first.due
    #=> 5

Copyright (c) 2010 [Mark Connell], released under the MIT license
