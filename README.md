# Bustracker

Edinburgh BusTracker via Ruby.

# Examples

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


Copyright (c) 2010 [Mark Connell], released under the MIT license
