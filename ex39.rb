#!/usr/bin/env ruby

ten_things = "Apples Oranges Crows Telephone Light Sugar"

puts "Wait there's not 10 things in that list, let's fix that."

stuff = ten_things.split(' ')
more_stuff = %w(Day Night Song Frisbee Corn Banana Girl Boy)

while stuff.length != 10
  next_one = more_stuff.pop()
  puts "Adding #{next_one}"
  stuff.push(next_one)
  puts "There's #{stuff.length} items now."
end

puts "There we go: #{stuff}"

puts "Let's do some things with stuff."

# second element. ruby array is 0 based.
puts stuff[1]
# last element. Negative index starts at end [-1]
puts stuff[-1] # whoa! fancy
# pop last element from array and return it
puts stuff.pop()
# return a string of stuff elements joined by ' '
puts stuff.join(' ') # what? cool!
# return element at index 3 and 5 joined by '#'
puts stuff.values_at(3,5).join('#') # super stellar!
