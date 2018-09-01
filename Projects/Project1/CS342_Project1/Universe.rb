require_relative 'Star'

class Universe
  attr_reader :stars, :max_star
  def initialize(max_stars)
    @stars = []
    @max_star = max_stars
    (1..max_stars).each do
      type = rand(3)
      s = nil
      if type == 0
        s = GiantStar.new
      elsif type == 1
        s = DwarfStar.new
      else
        s = MediumStar.new
      end
      @stars << s
    end
    @stars.sort!{|a,b|
      [a.x, a.y, a.z] <=> [b.x, b.y, b.z]
    }
  end

  def printUniverse()

    giant = 0
    dwarf = 0
    medium = 0
    gas = [0,0,0]
    rock = [0,0,0]
    habitable = [0,0,0]
    life = [0,0,0]
    total_stars = 0
    new_line = "\n"

    #calculate stars type
    @stars.each{|s|
      if s.is_a? GiantStar #calculate giant stars
        giant += 1

        #calculate planets for Giantstar
        s.planets.each {|p|
          if p.is_a? GaseousPlanet
            gas[0] += 1
          elsif p.is_a? RockyPlanet
            rock[0] += 1
          else
            habitable[0] += 1
            if p.inhabited
              life[0] += 1
            end
          end
        }
      elsif s.is_a? DwarfStar #calculate Dwarf stars
         dwarf += 1

         #calculate planets for Dwarf star
         s.planets.each {|p|
           if p.is_a? GaseousPlanet
             gas[1] += 1
           elsif p.is_a? RockyPlanet
             rock[1] += 1
           else
             habitable[1] += 1
             if p.inhabited
               life[1] += 1
             end
           end
         }
      else # calculate medium stars
        medium += 1

        #calculate planets for Giantstar
        s.planets.each {|p|
          if p.is_a? GaseousPlanet
            gas[2] += 1
          elsif p.is_a? RockyPlanet
            rock[2] += 1
          else
            habitable[2] += 1
            if p.inhabited
              life[2] += 1
            end
          end
        }
      end
    }

    total_stars = medium + dwarf + giant

    #print giant stars
    puts "This was run with #{max_star} stars\n\n"
    puts "Total number of stars in my universe #{total_stars}"
    puts "There are #{giant} Giant Stars with:"
    puts "\t#{gas[0]} Gaseous Planets\n\t#{rock[0]} Rocky Planets"
    puts "\t#{habitable[0]} Habitable Planets"
    puts "\t#{life[0]} Planets with intelligent Life\n\n"

    #print Dwarf stars
    puts "There are #{dwarf} Dwarf Stars with:"
    puts "\t#{gas[1]} Gaseous Planets\n\t#{rock[1]} Rocky Planets"
    puts "\t#{habitable[1]} Habitable Planets"
    puts "\t#{life[1]} Planets with intelligent Life\n\n"

    #print medium stars
    puts "There are #{medium} Medium Stars with:"
    puts "\t#{gas[2]} Gaseous Planets\n\t#{rock[2]} Rocky Planets"
    puts "\t#{habitable[2]} Habitable Planets"
    puts "\t#{life[2]} Planets with intelligent Life\n\n"
  end
end
