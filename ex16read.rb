#!/usr/bin/env ruby

# this variable isn't used. Defined as a reminder for the student?
scriptname = $0
# first argument after script name
filename = ARGV.first

puts "We're going to read #{filename}."

puts "Opening the file..."
# open filename in default read mode
target = File.open(filename)
# this puts the address of the file object
#<File:0x007fdb8204eb78>
puts target

puts "I'm going to list the file."
file_string = target.read()
# this puts the contents as a string
puts file_string

puts "And finally, we close it."
target.close()
