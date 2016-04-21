#!/usr/bin/ruby

require 'httparty'


def test_connection
  password = 'xxxx'
  username = 'xxxxx'
  auth = {:username => username, :password => password}
  puts "starting"
  begin
    request = HTTParty.get("https://xxxxxxxxx/suite-api/api/resources", :basic_auth => auth, :verify => false)
    puts "requested"
    puts request
  rescue Exception => e
    puts e
  end
end


test_connection
