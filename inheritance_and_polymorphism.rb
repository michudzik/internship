# Dziedziczenie
class Animal
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def speak
    puts 'default sound'
  end
end

class Dog < Animal
  def speak
    puts 'woof'
  end
end

class Cat < Animal
  def speak 
    puts 'meow'
  end
end

reksio = Dog.new('Reksio', 4)
reksio.speak

filemon = Cat.new('Filemon', 5)
filemon.speak