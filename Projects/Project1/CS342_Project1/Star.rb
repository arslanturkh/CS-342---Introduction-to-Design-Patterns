require_relative 'Planet'

class Star
  attr_reader :chances_of_life, :range_of_planets, :goldilocks_zone_min, :goldilocks_zone_max, :recharge
  attr_reader :planets, :x, :y, :z, :id
  attr_accessor :visited
  @@rocky_num = 0
  @@gaseous_num = 0
  @@habitable_num = 0
  def initialize(nChances_of_life, nRange_of_planets, nGoldilocks_zone_min, nGoldilocks_zone_max, nRecharge)
    @planets = []
    @x = rand(2**3..2**64) - 1
    @y = rand(2**3..2**64) - 1
    @z = rand(2**3..2**64) - 1
    @chances_of_life = nChances_of_life
    @range_of_planets = nRange_of_planets
    @goldilocks_zone_min = nGoldilocks_zone_min
    @goldilocks_zone_max = nGoldilocks_zone_max
    @racharge = nRecharge
    @visited = false
    generatePlanet
  end
#generate planets
  def generatePlanet
    (1..@range_of_planets).each do
      type = rand(3)
      p = nil
      #rocky planet
      if type == 0
        @id = 'r' + @@rocky_num.to_s
        p = RockyPlanet.new
        p.id = @id
        @@rocky_num += 1

      #gaseous planet
      elsif type == 1
        @id = 'g' + @@gaseous_num.to_s
        p = GaseousPlanet.new
        p.id = @id
        @@gaseous_num += 1

      #habitable planet  has life
      else
        @id = 'h' + @@habitable_num.to_s
        p = HabitablePlanet.new
        p.id = @id
        @@habitable_num += 1

        #check planet is habitable
        if (p.distance >= @goldilocks_zone_min) && (p.distance <= @goldilocks_zone_max)
          if rand(1..10000) <= @chances_of_life
            p.inhabited = true
          end
        end

      end
      @planets << p
    end
  end
end

class MediumStar < Star
  attr_reader :chances_of_life, :range_of_planets, :goldilocks_zone_min, :goldilocks_zone_max, :recharge
  def initialize
=begin
Chances of life: 0.0009
Range of planets: 2-9
Goldilocks Zone: 60-140
Recharge: 2**25
=end
    @chances_of_life = 5
    @range_of_planets = rand(2..9)
    @goldilocks_zone_min = 60
    @goldilocks_zone_max = 140
    @recharge = 2**25
    super(chances_of_life, range_of_planets, goldilocks_zone_min, goldilocks_zone_max, recharge)
  end
end

class DwarfStar < Star
  attr_reader :chances_of_life, :range_of_planets, :goldilocks_zone_min, :goldilocks_zone_max, :recharge
  def initialize
=begin
Chances of life: 0.0006
Range of planets: 8-15
Goldilocks Zone: 30-90
Recharge: 2**20
=end
    @chances_of_life = 6
    @range_of_planets = rand(8..15)
    @goldilocks_zone_min = 30
    @goldilocks_zone_max = 90
    @recharge = 2**20
    super(chances_of_life, range_of_planets, goldilocks_zone_min, goldilocks_zone_max, recharge)
  end
end

class GiantStar < Star
  attr_reader :chances_of_life, :range_of_planets, :goldilocks_zone_min, :goldilocks_zone_max, :recharge
  def initialize
=begin
Chances of life: 0.0005
Range of planets: 5-10
Goldilocks Zone: 100-250
Recharge: 2**30
=end
    @chances_of_life = 5
    @range_of_planets = rand(5..10)
    @goldilocks_zone_min = 100
    @goldilocks_zone_max = 250
    @recharge = 2**30
    super(chances_of_life, range_of_planets, goldilocks_zone_min, goldilocks_zone_max, recharge)
  end
end