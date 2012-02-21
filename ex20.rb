#!/usr/bin/env ruby

# Reference 
# http://rubylearning.com/satishtalim/read_write_files.html

# use first argument for file name
input_file = ARGV[0]

# print all of file f
def print_all(f)
  puts f.read()
end

def rewind(f)
  # set the file pointer to the beginning of the file
  # SEEK_SET: is a constant
  # http://ruby-doc.org/core-1.9.3/IO.html
  f.seek(0, IO::SEEK_SET)
end

# print a line from file f
def print_a_line(line_count, f)
  puts "#{line_count} #{f.readline()}"
end

# File is the only standard subclass of IO
current_file = File.open(input_file)

puts "First let's print the whole file:"
puts # a blank line

print_all(current_file)

puts "Now let's rewind, kind of like a tape."

rewind(current_file)

puts "Let's print three lines:"

current_line = 1
print_a_line(current_line, current_file)

current_line += 1
print_a_line(current_line, current_file)

current_line += 1
print_a_line(current_line, current_file)

current_file.close()
