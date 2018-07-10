# Return a singular noun if there is one bottle
def singularize_bottle(counter)
  counter == 1 ? 'bottle' : 'bottles'
end

# Returns an adequate ending for the song
def find_ending(counter)
  if counter == 0 
    ending = 'no more bottles'
  else
    ending = "#{counter - 1} #{singularize_bottle(counter)}"
  end
end

# Initialize counter - how many times will the song play
counter = 1

# Initialize an empty string
message = ""
counter.times do 

  # Repeat 94 times
  94.downto(6) do |number|
    message += "#{number} bottles of beer on the wall, #{number} bottles of beer. Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n\n"
  end

  # Last 5 times append numbers as strings and check for singular noun
  numbers = ['One', 'Two', 'Three', 'Four', 'Five']
  4.downto(0) do |number|
    beggining = singularize_bottle(number)
    ending = find_ending(number)
    message += "#{numbers[number]} #{beggining} of beer on the wall, #{numbers[number]} #{beggining} of beer. Take one down and pass it around, #{ending} of beer on the wall.\n\n"
  end

  message += 'No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall.'
  # Output message
  puts message
end