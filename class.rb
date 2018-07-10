class Animal
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  # Bezparametrowe
  def speak
    puts 'default'
  end

  # Parametrowe
  def speak2(sound)
    puts sound
  end
end

#animal = Animal.new
#animal.name = 'Czesiek'
#animal.age = 3

#puts "#{animal.name}, #{animal.age}"

#animal.speak
#animal.speak2 'woof'

animal = Animal.new('Czesio', 3)
puts "#{animal.name}, #{animal.age}"