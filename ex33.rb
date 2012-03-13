#!/usr/bin/env ruby

# http://ruby-doc.org/core-1.9.3/Range.html

def configure_array(number_of_elements, delta)
  my_range = Range.new(0, number_of_elements, exclusive=true)
  numbers = []
  for i in my_range
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

def configure_array_no_incrementor(number_of_elements)
  my_range = Range.new(0, number_of_elements, exclusive=true)
  numbers = []
  for i in my_range
    puts "At the top i is #{i}"
    numbers.push(i)
    puts "Numbers now: #{numbers}"
  end

  puts "The numbers: "
  for num in numbers
    puts num
  end
end

def configure_array_step(number_of_elements, delta)
  my_range = Range.new(0, number_of_elements, exclusive=true)
  numbers = []
  my_range.step(delta) { |range_element|
    puts "At the top range_element is #{range_element}"
    numbers.push(range_element)
    puts "Numbers now: #{numbers}"
  }
  puts "The numbers: "
  for num in numbers
    puts num
  end
end

configure_array(6, 1)
configure_array(3, 2)
configure_array(11, 3)

configure_array_no_incrementor(6)
configure_array_no_incrementor(3)
configure_array_no_incrementor(11)

configure_array_step(6, 1)
configure_array_step(3, 2)
configure_array_step(11, 3)

