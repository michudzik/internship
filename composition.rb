# Miksowanie - domieszkowanie
module LivesInSea
  def swim
    puts 'swimming'
  end
end

module Mammal
  def lungs?
    true
  end
end

class Whale
  include LivesInSea
  include Mammal
end

whale = Whale.new
whale.swim
puts whale.lungs?