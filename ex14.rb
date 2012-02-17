#!/usr/bin/env ruby

# ARGV is the argument variable, an array.
# In ruby, global variable $0 is the program name.
# ARGV[0] is the first argument.
# .first returns the first element of an array
# ARGV.first == ARGV[0]
# NOTE: In C, ARGV[0] is the program name and ARGV[1] is the first argument.
# http://ruby-doc.org/docs/ProgrammingRuby/html/rubyworld.html
user = ARGV.first

prompt = '>'

puts "Hi #{user}, I'm the #{$0} script."
puts "I'd like to ask you a few questions."
puts "Do you like me #{user}?"
print prompt
likes = STDIN.gets.chomp()

puts "Where do you live #{user}?"
print prompt
lives = STDIN.gets.chomp()

puts "What kind of computer do you have?"
print prompt
computer = STDIN.gets.chomp()

puts <<MESSAGE
Alright, so you said #{likes} about liking me.
You live in #{lives}. Not sure where that is.
And you have a #{computer} computer. Nice.
MESSAGE
