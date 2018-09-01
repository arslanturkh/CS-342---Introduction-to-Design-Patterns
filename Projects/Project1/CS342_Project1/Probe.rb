require_relative 'Universe'

class Probe
  attr_reader :start_x, :start_y, :start_z, :travel_distance, :visited_stars
  attr_reader :explored_planets, :remaining_fuel, :x_now, :y_now, :z_now
  attr_reader :distance, :my_universe, :isLife
  attr_reader :planet_id
  def initialize(nUniverse)
    @start_x = rand(0..2**64) - 1
    @start_y = rand(0..2**64) - 1
    @start_z = rand(0..2**64) - 1
    @travel_distance = 0
    @visited_stars = 0
    @explored_planets = 0
    @remaining_fuel = 2**73
    @my_universe = nUniverse
    @x_now = @start_x
    @y_now = @start_y
    @z_now = @start_z
    @isLife = false
    @distance = 0
    explore
  end

  def explore
    @my_universe.stars.each{|s|
      @distance = Math.sqrt(((@x_now - s.x)**2) + ((@y_now - s.y)**2) +((@z_now - s.z)**2))
      if @remaining_fuel > @distance
        s.visited = true
        #next address
        @x_now = s.x
        @y_now = s.y
        @z_now = s.z
        @visited_stars += 1
        @remaining_fuel = @remaining_fuel - @distance + s.recharge
        @travel_distance = @travel_distance + @distance

        s.planets.each {|p|
          if p.inhabited
            @isLife = true
            @planet_id = p.id
            #puts "pid" + p.id

          end
          @explored_planets += 1

          if @isLife == true
            break
          end
        }
      end

      if @isLife == true
        break
      end

    }

    @distance = Math.sqrt(((@x_now - @start_x)**2) + ((@y_now - @start_y)**2) +((@z_now - @start_z)**2))
#check fuel for returning to home
    if @distance > @remaining_fuel
      puts "Out of fuel"
    else
      @travel_distance += @distance
      @remaining_fuel -+ @distance
      print
    end

  end

  def print
    puts "=========="
    puts "Your origin was (#{start_x}, #{start_y}, #{start_z})"
    if @isLife
      puts "\tTraveled #{travel_distance} miles"
      puts "\tYou have #{remaining_fuel} remaining"
      puts "\tVisited #{visited_stars} stars"
      puts "\tExplored #{explored_planets} planets"
      puts "Found life on planet #{planet_id}"
    else
      puts "\tTraveled #{travel_distance} miles"
      puts "\tYou have #{remaining_fuel} remaining"
      puts "\tVisited #{visited_stars} stars"
      puts "\tExplored #{explored_planets} planets"
      puts "Life can not found"
    end

  end
end