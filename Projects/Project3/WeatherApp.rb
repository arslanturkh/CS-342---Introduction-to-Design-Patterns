require_relative "IpApi"
require_relative "CountryApi"
require_relative "Weather"
require_relative "Log"
require_relative "APIProxy"

class WheatherApp
  attr_reader :info_array, :last_location, :last_ip
  def initialize
    @info_array = Array.new()
    createHash
  end

  def createHash
    counter = 0
    wheather_hash = {ip: "n/a", city: "n/a", weather: "n/a", temperature: "n/a", pressure: "n/a",
                     humidity: "n/a", min_temperature: "n/a", max_temperature: "n/a", time: "n/a"}
    @info_array[counter] = wheather_hash
  end

  def getWheather
    last = 1
    @obj = Weather.new(CountryApi.new(IpApi.new))
    @data = @obj.getResult
    #puts @data
    changeHash
    Log.getPastResult(@info_array)
    @last_ip = @info_array[last]['ip']
    @last_location = @info_array[last]['city']
    Log.writeJson(@info_array)
    print
    puts " "

    @obj.ip = @last_ip
    @obj.location = @last_location
    @obj.url = @obj.url_first + @obj.location + @obj.url_last
    @obj.uri = URI(@obj.url)
    @data = @obj.getResult
    puts "The weather of your last location:"
  end

  def changeHash
    time = Time.new
    @info_array.each() do |info_hash|
      info_hash[:ip] = @obj.ip
      info_hash[:city] = @obj.location
      info_hash[:weather] = @data[0]
      info_hash[:temperature] = @data[1]
      info_hash[:pressure] = @data[2]
      info_hash[:humidity] = @data[3]
      info_hash[:min_temperature] = @data[4]
      info_hash[:max_temperature] = @data[5]
      info_hash[:time] = time.to_s
    end
  end

  def print
    puts "IP = " + @obj.ip
    puts "LOCATION = " + @obj.location
    puts "WEATHER = " + @data[0]
    puts "TEMPERATURE = " + @data[1] + "°C"
    puts "PRESSURE = " + @data[2] + " hpa"
    puts "HUMIDITY = " + @data[3] + "%"
    puts "MIN TEMPERATURE = " + @data[4] + "°C"
    puts "MAX TEMPERATURE = " + @data[5] + "°C"
  end
end