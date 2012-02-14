#!/usr/bin/env ruby

# References
# string formatting
LBM_PER_KG = 2.204

name = 'Zed A. Shaw'
age = 35 # not a lie
height = 74 # inches
weight_lb = 180 # lbs
eye_color = 'Blue'
teeth = 'White'
hair_color = 'Brown'

# can use format specifiers similar to Python
puts "Let's talk about %s." % name
# alternative format
puts "Let's talk about #{name}."

puts "He's %d inches tall." % height
puts "He's %d pounds heavy." % weight_lb
puts "He's %g kilograms heavy." % (weight_lb / LBM_PER_KG)
puts "Actually that's not too heavy."

puts "He's got #{eye_color} eyes and #{hair_color} hair."
# alternatively, can use format specifier similar to Python but with [ ]
puts "He's got %s eyes and %s hair." % [eye_color, hair_color]

puts "His teeth are usually %s depending on the coffee." % teeth

# this line is tricky, try to get it exactly right
puts "If I add %d, %d, and %d I get %d." % [
    age, height, weight_lb, age + height + weight_lb]
