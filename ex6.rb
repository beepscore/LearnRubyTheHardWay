#!/usr/bin/env ruby

# References

# put string in string #6 (converts int to string)
x = "There are #{10} types of people."
binary = "binary"
do_not = "don't"
# put string in string #1, #2
y = "Those who know #{binary} and those who #{do_not}."

puts x
puts y

# put string in string #3
puts "I said: #{x}."
# put string in string #4
puts "I also said: '#{y}'."

hilarious = false
# insert string value of bool hilarious in string
joke_evaluation = "Isn't that joke so funny?! #{hilarious}"
puts joke_evaluation

w = "This is the left side of..."
e = "a string with a right side."

# concatenate strings
puts w + e
