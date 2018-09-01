require_relative "APIProxy"

class Weather < APIProxy
  attr_accessor :ip, :location, :url, :url_first, :url_last, :uri
  def initialize(obj)
    @location = obj.getResult
    @ip = obj.ip
    @url_first = "http://api.openweathermap.org/data/2.5/weather?q="
    @url_last = "&units=metric&APPID=0631613edaf71370ccce59cf89e14bcd"
    @url = @url_first + @location + @url_last
    @uri = URI(@url)
  end

  def getResult
    obj = connection
    weatherData = [ (obj["weather"][0]["main"]), (obj["main"]["temp"].to_s), (obj["main"]["pressure"].to_s),
                    (obj["main"]["humidity"].to_s), (obj["main"]["temp_min"].to_s), (obj["main"]["temp_max"].to_s)]
    return weatherData
  end

  def fallBack
    puts "Failed to connect to weather data api. Printing n/a instead"
    return {"weather"=>[{"main"=>"n/a"}], "main"=>{"temp"=>"n/a", "pressure"=>"n/a", "humidity"=>"n/a", "temp_min"=>"n/a", "temp_max"=>"n/a"}}
  end
end