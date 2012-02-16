#!usr/bin/env ruby

# ARGV is the argument variable, an array.
# In ruby, global variable $0 is the program name.
# ARGV[0] is the first argument.
# .first returns the first element of an array
# ARGV.first == ARGV[0]
# NOTE: In C, ARGV[0] is the program name and ARGV[1] is the first argument.
# http://ruby-doc.org/docs/ProgrammingRuby/html/rubyworld.html
filename = ARGV.first

prompt = "> "
# text_file is a reference to the file
text_file = File.open(filename)

puts "Here's your file: #{filename}"
puts text_file.read()

puts "I'll also ask you to type it again:"
print prompt
#ruby expects file name without delimiters
filename_again = STDIN.gets.chomp()

text_file_again = File.open(filename_again)

puts text_file_again.read()
