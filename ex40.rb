#!/usr/bin/env ruby

cities = {'CA' => 'San Francisco',
          'MI' => 'Detroit',
          'FL' => 'Jacksonville'}

cities['NY'] = 'New York'
cities['OR'] = 'Portland'

def find_city(map, state)
  if map.include? state
    return map[state]
  else
    return "Not found."
  end
end

# ok pay attention!
# In cities hash, add entry with key :find and value method(:find_city)
cities[:find] = method(:find_city)
# log cities to show result
puts cities
# {"CA"=>"San Francisco", "MI"=>"Detroit", "FL"=>"Jacksonville", "NY"=>"New York", "OR"=>"Portland", :find=>#<Method: Object#find_city>}

while true
  print "State? (ENTER to quit) "
  state = gets.chomp

  # if user types return, state will be empty and execution will break from while loop
  break if state.empty?

  # this line is the most important ever! study!
  # this evaluates to puts find_city(cities, state)
  puts cities[:find].call(cities, state)
  # show equivalence
  puts find_city(cities, state)
end
