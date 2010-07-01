require 'rubygems'
require 'test/unit'
require 'active_support'
require 'fakeweb'
FakeWeb.allow_net_connect = false

require 'nokogiri'
require 'bus_tracker'
require 'bus_tracker/service'
require 'bus_tracker/bus_stop'

# Fake out the fetching of data for a bus service
FakeWeb.register_uri :get,
  'http://mybustracker.co.uk/getServicePoints.php?serviceMnemo=30',
  :body => File.open('/Users/mark/workspaces/ruby/bustracker/test/fake_service_number_response.xml', 'rb').read
