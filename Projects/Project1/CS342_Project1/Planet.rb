
class Planet
  attr_reader :distance
  attr_accessor :inhabited
  def initialize
    @distance = rand(1..301) #distance from star
    @inhabited = false #life is default false for all planets in the begining
  end
end

class RockyPlanet < Planet
  attr_accessor :id
  def initialize
    super
    @id = nil
  end
end

class GaseousPlanet < Planet
  attr_accessor :id
  def initialize
    super
    @id = nil
  end
end

class HabitablePlanet < Planet
  attr_accessor :id
  def initialize
    super
    @id = nil
  end
end