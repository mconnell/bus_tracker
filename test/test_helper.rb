require 'rubygems'
require 'test/unit'
require 'active_support'
require 'fakeweb'
require 'nokogiri'
require 'bus_tracker'
require 'bus_tracker/service'
require 'bus_tracker/bus_stop'

FakeWeb.allow_net_connect = false

# Fake out the fetching of data for a bus service
FakeWeb.register_uri :get,
  'http://old.mybustracker.co.uk/getServicePoints.php?serviceMnemo=30',
  :body => File.open(File.join(File.dirname(__FILE__), 'fake_service_number_response.xml'), 'rb').read

FakeWeb.register_uri :get,
  'http://old.mybustracker.co.uk/getBusStopDepartures.php?refreshCount=0&clientType=b&busStopCode=36232545&busStopDay=0&busStopService=0&numberOfPassage=4&busStopTime=&busStopDestination=0',
  :body => File.open(File.join(File.dirname(__FILE__), 'fake_bus_stop_code_response.xml'), 'rb').read
