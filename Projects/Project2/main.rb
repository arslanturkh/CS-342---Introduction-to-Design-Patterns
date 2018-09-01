require_relative 'gladiator'
require_relative 'audience'
require_relative 'arena'
require_relative 'middleAge'
require_relative 'marioWorld'

def main

  @speed = 0
  @strength = 0
  @intelligence = 0
  @health = 0
  @name


 loop do
    puts "Give your gladiator name and atributes. Total attribute cannot be more than 20"
    puts "Give the gladiator name: "
    @name = gets.chomp
    puts "Give " + @name + " speed:"
    @speed = gets.to_i
    puts "Give " + @name + " strength:"
    @strength = gets.to_i
    puts "Give " + @name + " intelligence:"
    @intelligence = gets.to_i
    puts "Give " + @name + " health:"
    @health = gets.to_i

    if @health == 0
      puts "Health cannot be 0!"
    end

   break if (@speed + @strength + @intelligence + @health) < 21 && @health != 0 #continue until conditions are provided
  end

  #create gladiator
  my_gladiator = Gladiator.new(@speed,@strength,@intelligence,@health,@name)
  puts my_gladiator.name

  #create audience and enrol them
  for i in 1..10
    my_audience = Audience.new(rand(3))
    my_gladiator.register(my_audience)
  end

  arena = MiddleAge.new(my_gladiator)
  arena.templateMethod(my_gladiator)
  arena2 = MarioWorld.new(my_gladiator)
  arena2.templateMethod(my_gladiator)

  #deregister audience
  for i in 1..10
    my_gladiator.deregister(my_audience)
  end
end

main