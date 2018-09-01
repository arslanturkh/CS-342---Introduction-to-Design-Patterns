require_relative 'response'

class Audience
  attr_accessor :audience
  def initialize(type)
    setResponseType(type)
  end


  def setResponseType(ntype)
    if (ntype == 0)
      @audience = Good.new
    elsif (ntype == 1)
      @audience = Bad.new
    else
      @audience = Bored.new
    end
  end

  def update(nevent)
    if nevent == "win"
      @audience.winReact
    elsif nevent == "lose"
      @audience.loseReact
    elsif nevent == "harmed"
      @audience.harmedReact
    end
  end
end