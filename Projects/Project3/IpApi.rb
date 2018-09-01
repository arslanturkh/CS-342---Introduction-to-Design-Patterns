require_relative "APIProxy"

class IpApi < APIProxy
  def initialize
    @uri = URI("https://api.ipify.org?format=json")
  end

  def getResult
    obj = connection
    return obj["ip"].to_s
  end

  def fallBack
    puts "Failed to connect Ip Api, using 198.255.139.145 instead"
    return {"ip"=>"198.255.139.145"}
  end
end