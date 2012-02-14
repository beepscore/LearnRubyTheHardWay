#!/usr/bin/env ruby

formatter = "%s %s %s %s"

puts formatter % [1, 2, 3, 4]
# output doesn't have surrounding "" or ''
# in Python, output has ' ' surrounding each word
puts formatter % ["one", "two", "three", "four"]

puts formatter % [true, false, false, true]

# substitutes 4 formatter string arguments into first formatter string
puts formatter % [formatter, formatter, formatter, formatter]

puts formatter % [
        "I had this thing.", 
        "That you could type up right.", 
        "But it didn't sing.",
        "So I said goodnight."
        ]

