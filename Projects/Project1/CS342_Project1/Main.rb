require_relative 'Universe'
require_relative 'Probe'

def main
  # 2**20 has fatal error
  my_universe = Universe.new(2**10)
  my_universe.printUniverse()
  hello = Probe.new(my_universe)
end

main