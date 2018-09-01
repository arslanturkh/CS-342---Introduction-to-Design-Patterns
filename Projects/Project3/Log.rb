require 'json'

module Log
  class << self
    def writeJson(ninfoArray)
      File.open("Log.json","w") do |file|
        ninfoArray.each() do |info_hash|
          file << info_hash.to_json
          file << "\n"
        end
      end
    end

    def getPastResult(ninfoArray)
      counter = 1
      File.open('Log.json').each do |line|
        old_data_hash = JSON.parse(line)
        ninfoArray[counter] = old_data_hash
        counter = counter + 1
      end
    end
  end
end