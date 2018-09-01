require_relative 'audience'

class Gladiator
  attr_reader :speed, :strength, :intelligence, :name, :check_total_attributes
  attr_accessor :health, :audience
  def initialize(nspeed, nstrength, nintelligence, nhealth, nname)
    @check_total_attributes = nspeed + nstrength + nintelligence + nhealth
    if (check_total_attributes <= 20)
      @speed = nspeed
      @strength = nstrength
      @intelligence = nintelligence
      @health = nhealth
      @name = nname
      @audience = []
    else
      puts "Total attribute cannot be more than 20"
      raise NotImplementedError

    end
  end

  def register(naudience)
    @audience << naudience
  end

  def deregister(naudience)
    @audience.delete(naudience)
  end

  def notifyAudience(nevent)
    @audience.each do |audiences|
      audiences.update(nevent)
    end
  end
end