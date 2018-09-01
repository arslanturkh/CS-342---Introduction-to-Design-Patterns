require_relative "APIProxy"

class CountryApi < APIProxy
  attr_accessor :ip
  def initialize(obj)
      @ip =obj.getResult
      @uri = URI("http://ip-api.com/json/" + @ip)
  end

  def getResult
    obj = connection
    return obj["city"] + "," + obj["countryCode"]
  end

  def fallBack
    puts "Failed to connect City Api, using Binghamton , US instead"
    return {"city"=>"Binghamton" , "countryCode"=>"US"}
  end
end