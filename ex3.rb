#!/usr/bin/env ruby

# ruby puts, Python print
puts "I will now count my chickens:"

puts "Hens", 25 + 30 / 6
puts "Roosters", 100 - 25 * 3 % 4

puts "Now I will count the eggs:"

# precedence 3 + 2 + 1 - 5 + (4 % 2) - (1 / 4) + 6
# precedence  1  + (0) - (0) + 6 = 7
puts 3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6

puts "Is it true that 3 + 2 < 5 - 7?"

puts 3 + 2 < 5 - 7

puts "What is 3 + 2?", 3 + 2
puts "What is 5 - 7?", 5 - 7

puts "Oh, that's why it's false."

puts "How about some more."

puts "Is it greater?", 5 > -2
puts "Is it greater or equal?", 5 >= -2
puts "Is it less or equal?", 5 <= -2


puts "Extra Credit- floating point"
puts "I will now count my chickens:"

# ruby float requires at least one digit after decimal
# also putting inner parens only didn't work
puts "Hens", (25.0 + (30.0 / 6.0))
puts "Roosters", 100 - ((25 * 3) % 4)

puts "Now I will count the eggs:"

puts 3 + 2 + 1 - 5 + (4 % 2) - (1.0 / 4) + 6

puts "Is it true that 3 + 2 < 5 - 7?"

puts 3 + 2 < 5 - 7

puts "What is 3 + 2?", 3 + 2
puts "What is 5 - 7?", 5 - 7

# ruby false, Python False
puts "Oh, that's why it's false."

puts "How about some more."

puts "Is it greater?", 5 > -2
puts "Is it greater or equal?", 5 >= -2
puts "Is it less or equal?", 5 <= -2

