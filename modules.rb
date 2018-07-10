# Moduły

module Sports
  class Squash
    def what
      puts 'you play it with friends'
    end
  end
end

module Vegetables
  class Squash
    def  what
      puts 'i am a vegetable'
    end
  end
end

a = Vegetables::Squash.new
a.what

a = Sports::Squash.new
a.what