#!/usr/bin/env ruby

script = $0
from_file, to_file = ARGV

puts "Copying from #{from_file} to #{to_file}"

# we could do these two on one line too, how?
#input = File.open(from_file)
#indata = input.read()
# this collapses two lines into one, but makes closing awkward
indata = File.open(from_file).read()

puts "The input file is #{indata.length} bytes long"

puts "Does the output file exist? #{File.exists? to_file}"

puts "Ready, hit RETURN to continue, CTRL-C to abort."
STDIN.gets

output = File.open(to_file, 'w')
output.write(indata)

puts "Alright, all done."

# http://stackoverflow.com/questions/4795447/rubys-file-open-and-the-need-for-f-close
output.close()

#input.close()
# I think this closes the open file, 
# doesn't leave it open by opening twice and closing once.
File.open(from_file).close()
