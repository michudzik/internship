# Wyrażenia warunkowe

# I opcja
if 2 + 2 == 4
  puts 'math works'
elsif 3 + 3 == 6
  puts 'it\'s 6'
else
  puts 'is\'s not working'
end

# II opcja - rzadko używane
if (2 + 3 == 4) then puts 'not 4'
elsif (3 + 3 == 6) then puts 'this is ok'
else puts 'other options'
end

# III opcja - używane jako assignement zazwyczaj
12 > 14 ? puts('is greater') : puts('is not')   
2 + 2 == 4 ? puts('is equal') : puts('is not')  

# Zaprzeczenia
# false
# !false
# !(true && true)
# true && !true

# Warunek przeciwstawny
if !false
  puts 'test ok'
end

if not false 
  puts 'test ok'
end

# unless == if not
unless false
  puts 'test ok'
end

# Wyrażenie a nie tylko instrukcja

math_working = if 2 + 2 == 4
  'is is equal'
else
  'it is not'
end
puts math_working

# Modyfikator
username = "cokolwiek"
admin = true
puts "Witaj, #{username}" if admin