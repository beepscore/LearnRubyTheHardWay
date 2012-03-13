#!/usr/bin/env ruby

def configure_array(number_of_elements, delta)
  i = 0
  numbers = []
  while i < number_of_elements
    puts "At the top i is #{i}"
    numbers.push(i)
    i = i + delta
    puts "Numbers now: #{numbers}"
    puts "At the bottom i is #{i}"
  end

  puts "The numbers: "
  for num in numbers
    puts num
  end
end

configure_array(6, 1)
configure_array(3, 2)
configure_array(11, 3)
