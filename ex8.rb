#!/usr/bin/env ruby

formatter = "%s %s %s %s"

puts formatter % [1, 2, 3, 4]
# output surrounds each word with ' '
puts formatter % ["one", "two", "three", "four"]

puts formatter % [true, false, false, true]

# substitues 4 formatter string arguments into first formatter string
puts formatter % [formatter, formatter, formatter, formatter]

puts formatter % [
        "I had this thing.", 
        "That you could type up right.", 
        "But it didn't sing.",
        "So I said goodnight."
        ]

