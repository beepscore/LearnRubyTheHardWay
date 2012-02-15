#!/usr/bin/env ruby

# References

# use print instead of puts to avoid newline
print "How old are you? "
# http://ruby-doc.org/core-1.9.3/IO.html#method-i-gets
# http://ruby-doc.org/core-1.9.3/String.html#method-i-chomp
# get the string, chomp removes carriage return characters.
age = gets.chomp()
print "How tall are you? "
height = gets.chomp()
print "How much do you weigh? "
weight = gets.chomp()

puts "So, you're #{age} old, #{height} tall and #{weight} heavy."
