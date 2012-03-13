#!/usr/bin/env ruby

the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

# this first kind of for-loop goes through an array
for number in the_count
  puts "This is count #{number}"
end

# same as above, but using a block instead
fruits.each do |fruit|
  puts "A fruit of type: #{fruit}"
end

# also we can go through mixed arrays too
for i in change
  puts "I got #{i}"
end

# we can also build arrays, first start with an empty one
elements = []

# then use a range object to do 0 to 5 counts
# http://ruby-doc.org/core-1.9.3/Range.html
for i in (0..5)
  puts "Adding #{i} to the list."
  # push is a function that arrays understand
  elements.push(i)
end

# now we can puts them out too
for i in elements
  puts "Element was: #{i}"
end

# extra credit- assign a range directly to array elements
# I thought about using first(n) with n equal to the range length. Didn't see a method to get range length.
# http://stackoverflow.com/questions/191329/correct-way-to-populate-an-array-with-a-range-in-ruby
# http://www.ruby-doc.org/core-1.9.3/Array.html#method-i-to_a
my_range = (0..5)
my_elements = my_range.to_a
puts "my_elements: #{my_elements}"
