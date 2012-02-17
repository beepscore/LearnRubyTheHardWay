#!/usr/bin/env ruby

# ARGV is argument variable
first, second, third = ARGV

puts "The script is called #{$0}"
puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"

print "Please enter a fourth value: "
# unlike previous exercise, must specify STDIN
# default gets method treats first ARGV argument as a file name to read input from a file.
fourthVariable = STDIN.gets.chomp()

puts "Your fourth variable is #{fourthVariable}"
