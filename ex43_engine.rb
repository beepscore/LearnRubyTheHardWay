#!/usr/bin/env ruby

# require <filename> didn't work without leading ./
# require 'ex43_map.rb'
require './ex43_map.rb'

class Engine

  # initialize a game
  # parameter start is a label representing the starting location
  def initialize(start)
    @a_map = Map.new()
    @quips = ["You died. You kinda suck at this.",
              "So how's it feel to be dead?",
              "Such a luser.",
              "I have a small puppy that's better at this."]
    @start = start
    puts "in init @start = " + @start.inspect
  end

  def play()
    puts "@start => " + @start.inspect
    next_room_symbol = @start

    while true
      puts "\n---------"

      if next_room_symbol == :death
        # call Engine method death()
        death()
      else
        # Symbol next_room_symbol has a correspondingly named method in object a_map.
        # We will use the symbol to get a reference to a_map's method.
        # method() instantiates a method object
        # http://ruby-doc.org/core-1.9.3/Object.html#method-i-method
        # Get a_map's method and assign it to room.
        room = @a_map.method(next_room_symbol)

        # Call "room", an a_map method
        # room.call() returns a symbol e.g. :central_corridor, :death, :the_bridge
        # Note the returned symbol may be defined in Engine but not in Map, e.g. :death
        # Assign the return value to next_room_symbol
        next_room_symbol = room.call()
      end

    end
  end

  def death()
    puts @quips[rand(@quips.length())]
    # exit with code 1 to indicate player died
    Process.exit(1)
  end

end #Engine

# new calls initialize method
a_game = Engine.new(:central_corridor)
a_game.play()

