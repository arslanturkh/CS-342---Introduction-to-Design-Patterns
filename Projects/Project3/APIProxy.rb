require 'net/http'
require 'json'

class APIProxy
  def initialize
    raise NotImplementedError
  end

  def connection
    begin
      proxy = Net::HTTP.get(@uri)
      return JSON.parse(proxy)
    rescue
      return fallBack
    end
  end

  def getResult
    raise NotImplementedError
  end

  def fallBack
    raise NotImplementedError
  end
end