#!usr/bin/env ruby

# ARGV is argument variable
first, second, third = ARGV

puts "The script is called #{$0}"
puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"

print "Please enter a fourth value: "
# unlike previous exercise, must specify STDIN
# without STDIN, I think ruby tries to use parameter "first" as a file name to read from a file.
fourthVariable = STDIN.gets.chomp()

puts "Your fourth variable is #{fourthVariable}"
