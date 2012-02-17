#!/usr/bin/env ruby

# this variable isn't used. Defined as a reminder for the student?
scriptname = $0
# first argument after script name
filename = ARGV.first

puts "We're going to erase #{filename}."
puts "To cancel, hit CTRL-C (^C)."
puts "To erase, hit RETURN."

print "?"
STDIN.gets

puts "Opening the file..."
# open filename in write mode
# open(filename) with no mode argument defaults to read-only for safety.
target = File.open(filename, 'w')

puts "Truncating the file. Goodbye!"
target.truncate(target.size)

puts "Now I'm going to ask you for three lines."

print "line 1: "; line1 = STDIN.gets.chomp()
print "line 2: "; line2 = STDIN.gets.chomp()
print "line 3: "; line3 = STDIN.gets.chomp()

puts "I'm going to write these to the file."

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

puts "And finally, we close it."
target.close()
