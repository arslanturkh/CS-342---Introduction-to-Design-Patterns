

class Response

  def initialize
    raise NotImplementedError
  end
end

class Good < Response
  def initialize

  end

  def winReact
    puts "Hooray! Another wictory"
  end

  def loseReact
    puts "RIP"
  end

  def harmedReact
    puts "Please somebody help him!"
  end
end

class Bad < Response
  def initialize

  end


  def winReact
    puts "This is ridiculous!"
  end

  def loseReact
    puts "Hahaha! You suck!"
  end

  def harmedReact
    puts "Auch! That must be hurt!"
  end
end

class Bored < Response

  def initialize


  end
  def winReact
    puts "Who wins?"
  end

  def loseReact
    puts "Finally It's over!"
  end

  def harmedReact
    puts "How much is hotdog?"
  end
end