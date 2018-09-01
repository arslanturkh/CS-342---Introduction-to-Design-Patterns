require_relative 'gladiator'

class Arena
  def initialize
    raise NotImplementedError
  end

  def templateMethod(ngladiator)
    battleTest(ngladiator)
    intelligenceTest(ngladiator)
    speedTest(ngladiator)
  end

  def battleTest(ngladiator)
    raise NotImplementedError
  end

  def intelligenceTest (ngladiator)
    raise NotImplementedError
  end

  def speedTest (ngladiator)
    raise NotImplementedError
  end

  def fight(ngladiator)
    raise NotImplementedError
  end
end



