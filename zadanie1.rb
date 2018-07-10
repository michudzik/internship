# Read content of a file
# path: string
def read_file(path)
  words = []
  File.open(path, "r") do |f|
    f.each_line do |line|
      words << line
    end
  end
  words
end

# Calculate levenshtein distance
def levenshtein_algorithm(first_word, second_word)
  # Split words into arrays
  first_word = first_word.chomp.split('')
  second_word = second_word.chomp.split('')

  # Initialize counter
  counter = 0

  # Find length
  length_1 = first_word.length 
  length_2 = second_word.length

  # Find shorter 
  shorter = length_1 < length_2 ? length_1 : length_2

  # Calculate by how many letters do the words differ
  if length_1 != length_2
   delta = (length_2 - length_1).abs
   counter += delta
  end

  # Calculate which letters differ
  shorter.times do |iter|
   if first_word[iter] != second_word[iter]
    counter += 1
    end
  end
  counter
end

class WrongNumberOfArguments < StandardError
end

# input_array = ARGV
# if input_array.length != 0
#   if input_array.length < 2
#     raise "Not enough arguments"
#   end
#   words <<  input_array[0]
#   words <<  input_array[1]
# else
#   puts "First word:"
#   words << gets
#   puts "Second word:"
#   words << gets
# end

# Read file
words = read_file("words.txt")

# Validate input
if words.size < 2
  raise WrongNumberOfArguments.new('Not enough words')
end

result = levenshtein_algorithm(words[0], words[1])

# Output result
puts result