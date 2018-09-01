require_relative "WeatherApp"

def main
  #@obj = Weather.new(CountryApi.new(IpApi.new))
  #@data = @obj.getResult
  #puts @data
  #puts @obj.ip
  #puts @obj.location
  @wheather = WheatherApp.new
  @wheather.getWheather
  @wheather.print
  #puts "yarrak".colorize(:red)
end

main