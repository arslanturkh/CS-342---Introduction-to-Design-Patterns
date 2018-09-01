require_relative 'arena'

class MiddleAge < Arena
  attr_reader :my_gladiator, :choice
  attr_reader :gladiator_health, :gladiator_intelligence, :gladiator_strength, :gladiator_speed
  def initialize(ngladiator)
    @my_gladiator = ngladiator
    puts "Welcome to middle age"
    puts "Choose your weapon: "
    puts "Dagger(Speed = 0, Strength = 4, Intelligence = -1, Health = 1)"
    puts "Spear (Speed = -1, Strength = 4, Intelligence = -1, Health = 2)"
    puts "Sword (Speed = 0, Strength = 0, Intelligence = 2, Health = 2)"
    @choice = gets.chomp
    if @choice.downcase == "dagger"
      @gladiator_speed = my_gladiator.speed
      @gladiator_strength = my_gladiator.strength + 4
      @gladiator_intelligence = my_gladiator.intelligence - 1
      @gladiator_health = my_gladiator.health + 1
      #puts "daggerburada"
    elsif @choice.downcase == "spear"
      @gladiator_speed = my_gladiator.speed - 1
      @gladiator_strength = my_gladiator.strength + 4
      @gladiator_intelligence = my_gladiator.intelligence - 1
      @gladiator_health = my_gladiator.health + 2
      #puts "spearburada"
    elsif @choice.downcase == "sword"
      @gladiator_speed = my_gladiator.speed
      @gladiator_strength = my_gladiator.strength
      @gladiator_intelligence = my_gladiator.intelligence + 2
      @gladiator_health = my_gladiator.health + 2
      #puts "swordburada"
    else
      @gladiator_speed = my_gladiator.speed
      @gladiator_strength = my_gladiator.strength
      @gladiator_intelligence = my_gladiator.intelligence
      @gladiator_health = my_gladiator.health
      puts "You are unarmed! Good Luck idiot!"
    end


  end

  def battleTest(ngladiator)
    @enemy_name = "Windmill"
    puts "Enemy name: " + @enemy_name
    @enemy_attributes = 24 #total values of enemy
    #health
    @enemy_health = rand(2..@enemy_attributes)
    @enemy_attributes = @enemy_attributes - @enemy_health
    puts "Enemy health: " + @enemy_health.to_s()
    #strengt
    if @enemy_attributes >= 2
      @enemy_strength = rand(2..@enemy_attributes)
      @enemy_attributes = @enemy_attributes - @enemy_strength
      puts "Enemy strength: " + @enemy_strength.to_s()
    else
      @enemy_strength = 2
      puts "Enemy strength: " + @enemy_strength.to_s()
    end
    #speed
    if @enemy_attributes >= 2
      @enemy_speed = rand(2..@enemy_attributes)
      @enemy_attributes = @enemy_attributes - @enemy_speed
      puts "Enemy speed: " + @enemy_speed.to_s()
    else
      @enemy_speed = 2
      puts "Enemy speed: " + @enemy_speed.to_s()
    end
    #intelligence
    if @enemy_attributes >= 2
      @enemy_intelligence = @enemy_attributes
      puts "Enemy intelligence: " + @enemy_intelligence.to_s()
    else
      @enemy_intelligence = 2
      puts "Enemy intelligence: " + @enemy_intelligence.to_s()
    end


    while(@gladiator_health > 0 && @enemy_health > 0)
      #gladiator attack
      if (rand(24) <= @gladiator_intelligence && rand(24) <= @gladiator_speed)
        @enemy_health = @enemy_health - @gladiator_strength/2
        puts my_gladiator.name + " attacked " + (@gladiator_strength/2).to_s()
      end
      #enemy attack
      if(@enemy_health > 0 && rand(24) <= @enemy_speed && rand(24) <= @enemy_intelligence)
        @gladiator_health = @gladiator_health - @enemy_strength/2
        puts @enemy_name + " attaced " + (@enemy_strength/2).to_s()
        @my_gladiator.notifyAudience("harmed")
      end
    end

    if (@enemy_health > 0)
      puts "Windmill won the battle!"
      @my_gladiator.notifyAudience("lose")
    else
      puts @my_gladiator.name + " won the battle!"
      @my_gladiator.notifyAudience("win")
    end
    puts "\n\n"
  end

  def intelligenceTest(ngladiator)
    puts "Lets see if you can outsmart a windmill!"
    puts "There will be a math problem. Are you ready? "
    gets.chomp
    if (@my_gladiator.intelligence >= 15)
      puts "You look clever. Here your question is: "
      number1 = rand(1..10)
      number2 = rand(1..10)
      result = number1 * number2
      puts number1.to_s + " x " + number2.to_s + " = ?"
      answer = gets.to_i

      if (answer == result)
        puts "Why do you even challenge a windmill with math"
        @my_gladiator.notifyAudience("win")
      else
        puts "Stupid!"
        @my_gladiator.notifyAudience("lose")
      end
    elsif(@my_gladiator.intelligence < 5)
      puts "You don't have a chance to win fool"
      number1 = rand(1..30)
      number2 = rand(1..30)
      result = number1 * number2
      puts number1.to_s + " x " + number2.to_s + " = ?"
      answer = gets.to_i

      if (answer == result)
        puts "I underestimated your intelligence."
        @my_gladiator.notifyAudience("win")
      else
        puts "I told you"
        @my_gladiator.notifyAudience("lose")
      end
    else
      puts "You look compatative. Here your question is: "
      number1 = rand(1..20)
      number2 = rand(1..20)
      result = number1 * number2
      puts number1.to_s + " x " + number2.to_s + " = ?"
      answer = gets.to_i

      if (answer == result)
        puts "Good game"
        @my_gladiator.notifyAudience("win")
      else
        puts "gg"
        @my_gladiator.notifyAudience("lose")
      end
    end
    puts "\n\n"
  end

  def speedTest(ngladiator)
    puts "You cant be faster than windmill!"
    speed_limit = 20

    if (@my_gladiator.speed >= 15)
      to_write = "Haydi bastir Kara Kartal"
    elsif (@my_gladiator.speed >= 5)
      to_write = "Sana adanmis butun hayatlar, Haydi bastir Kara Kartal"
    else
      to_write = "Bolunur senin icin uykular, Gidilecek cok deplasman var, Sana adanmis butun hayatlar, Haydi bastir Kara Kartal"
    end
    puts "Are you ready for speed test? "
    gets.chomp
    puts to_write
    time = Time.now
    input = gets.chomp
    spent_time = Time.now - time

    if to_write == input && spent_time <= speed_limit
      puts "Congralutation! You achieved"
      @my_gladiator.notifyAudience("win")
    else
      puts "Loser"
      @my_gladiator.notifyAudience("lose")
    end
  end
  puts "\n\n\n"
end