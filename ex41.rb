#!/usr/bin/env ruby

require 'pp'

def prompt()
  print "> "
end

def death()
  quips = ["You died. You kinda suck at this.",
           "So how's it feel to be dead?",
           "Such a luser.",
           "I have a small puppy that's better at this."]
  puts quips[rand(quips.length())]
  # exit with code 1 to indicate player died
  Process.exit(1)
end

def central_corridor()
  # heredocs can start with << or with <<-
  # if they start with <<, the ending delimeter must be in column 1.
  puts <<-CENTRAL_CORRIDOR_HEREDOC
    The Gothons of Planet Percal #25 have invaded your ship and destroyed
    your entire crew. You are the last surviving member and your last
    mission is to get the neutron destruct bomb from the Weapons Armory,
    put it in the bridge, and blow the ship up after getting into an 
    escape pod.

    You're running down the central corridor to the Weapons Armory when
    a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume
    flowing around his hate filled body. He's blocking the door to the
    Armory and about to pull a weapon to blast you.
  CENTRAL_CORRIDOR_HEREDOC

  prompt()
  action = gets.chomp()

  if action == "shoot!"
    puts <<-SHOOT_HEREDOC
      Quick on the draw you yank out your blaster and fire it at the Gothon.
      His clown costom is flowing and moving around his body, which throws
      off your aim. Your laser hits his costume but misses him entirely. This
      makes him fly into an insane rage and blast you repeatedly in the face until
      you are dead. Then he eats you.
    SHOOT_HEREDOC
    return :death

  elsif action == "dodge!"
    puts <<-DODGE_HEREDOC
      Like a world class boxer you dodge, weave, slip and slide right
      as the Gothon's blaster cranks a laser past your head.
      In the middle of your artful dodge your foot slips and you
      bang your head on hte metal wall and pass out.
      You wake up shortly after only to die as the Gothon stomps on
      your head and eats you.
    DODGE_HEREDOC
    return :death

  elsif action == "tell a joke"
    puts <<-JOKE_HEREDOC
      Lucky for you they made you learn Gothon insults in the academy.
      You tell the one Gothon joke you know:
      Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr.
      The Gothon stops, tries not to laugh, then busts out laughing and can't move.
      While he's laughing you run up and shoot him square in the head
      putting him down, then jump through the Weapon Armory door.
    JOKE_HEREDOC
    return :laser_weapon_armory

  else
    puts "DOES NOT COMPUTE!"
    return :central_corridor
  end
end

def laser_weapon_armory()
  puts <<-LASER_HEREDOC
    You do a dive roll into the Weapon Armory, crouch and scan the room
    for more Gothons that might be hiding. It's dead quiet, too quiet.
    You stand up and run to the far side of the room and find the
    neutron bomb in its container. There's a keypad lock on the box
    and you need the code to get the bomb out. If you get the code
    wrong 10 times then the lock closes forever and you can't get the bomb. The code is 3 digits.
  LASER_HEREDOC
  # code = "%s%s%s" % [rand(9)+1, rand(9)+1, rand(9)+1]
  # Make the game easier than instructions say. 
  # Give the player 10 guesses
  # Each time they have a (number_of_winning_combinations/1000) chance.
  number_of_winning_combinations = 100
  all_combinations = Hash.new()
  for index in 0..999 do
    # use each possible 3 digit combination as a key and assign a random number as a value
    # Then we will sort the key-value pairs by the random values
    # Then choose the lowest n key-value pairs
    # I'm pretty sure this selection method avoids a lot of non-random selection bias.
    # Each key had an equal chance of being assigned its position, so this is random.
    # rand function may do better with a seed and not restarting each iteration
    # Probably it could be done more concisely and elegantly.
    # rand returns an integer greater than or equal to zero, less than argument.
    # choose a very large argument to reduce the chance of duplicate values.
    # Ignore small effect of possible duplicates.
    # ruby will convert a Fixnum to Bignum if necessary
    # http://stackoverflow.com/questions/535721/ruby-max-integer
    all_combinations[index] = rand(1000000)
  end

  # sort all possible combination key-value pairs by randomly assigned value
  # http://stackoverflow.com/questions/8580497/how-to-get-first-n-elements-from-hash-in-ruby
  all_combinations_sorted_by_value = Hash[all_combinations.sort_by { |key,value| value }]
  # get the keys as an array
  sorted_combinations_keys = all_combinations_sorted_by_value.keys
  # choose the lowest (number_of_winning_combinations) combinations
  winning_combinations = sorted_combinations_keys[0...number_of_winning_combinations]
  # now re-sort winning_combinations in numerical order
  winning_combinations.sort!
  #puts "winning_combinations"
  #pp winning_combinations

  for guesses in 1..10 do 
    print "[keypad]> "
    guess = gets.chomp().to_i
    if winning_combinations.include? guess
      break
    else
      puts "BZZZZEDD!"
    end
  end

  if winning_combinations.include? guess    
    puts <<-BOMB_UNLOCK_HEREDOC
     The container clicks open and the seal breaks, letting gas out.
     You grab the neutron bomb and run as fast as you can to the
     bridge where you must place it in the right spot.
    BOMB_UNLOCK_HEREDOC
    return :the_bridge
  else
    puts "The lock buzzes one last time and then you hear a sickening"
    puts "melting sound as the mechanism is fused together."
    puts "You decide to sit there, and finally the Gothons blow up the"
    puts "ship from their ship and you die."
    return :death
  end
end

def the_bridge()
  puts <<-BRIDGE_HEREDOC
    You burst onto the Bridge with the neutron destruct bomb
    under your arm and surprise 5 Gothons who are trying to
    take control of the ship. Each of them has an even uglier
    clown costume than the last. They haven't pulled their
    weapons out yet, as they see the active bomb under your
    arm and don't want to set it off.
  BRIDGE_HEREDOC

  prompt()
  action = gets.chomp()

  if action == "throw the bomb"
    puts <<-THROW_BOMB_HEREDOC
      In a panic you throw the bomb at the group of Gothons
      and make a leap for the door. Right as you drop it a
      Gothon shoots you right in the back killing you.
      As you die you see another Gothon frantically try to disarm
      the bomb. You die knowing they will probably blow up when
      it goes off.
    THROW_BOMB_HEREDOC
    return :death

  elsif action == "slowly place the bomb"
    puts <<-PLACE_BOMB_HEREDOC
      You point your blaster at the bomb under your arm
      and the Gothons put their hands up and start to sweat.
      You inch backward to the door, open it, and then carefully
      place the bomb on the floor, pointing your blaster at it.
      You then jump back through the door, punch the close button
      and blast the lock so the Gothons can't get out.
      Now that the bomb is placed you run to the escape pod to
      get off this tin can.
    PLACE_BOMB_HEREDOC
    return :escape_pod

  else
    puts "DOES NOT COMPUTE!"
    return :the_bridge
  end
end

def escape_pod()
  puts <<-ESCAPE_POD_HEREDOC
    You rush through the ship desperately trying to make it to
    the escape pod before the whole ship explodes. It seems like
    hardly any Gothons are on the ship, so your run is clear of
    interference. You get to the chamber with the escape pods, and
    now need to pick one to take. Some of them could be damaged
    but you don't have time to look. There's 5 pods, which one
    do you take?
  ESCAPE_POD_HEREDOC

  good_pod = rand(5)+1
  print "[pod #]>"
  guess = gets.chomp()

  if guess.to_i != good_pod
    puts  "      You jump into pod %s and hit the eject button." % guess
    puts <<-BAD_POD_HEREDOC
      The pod escapes out into the void of space, then
      implodes as the hull ruptures, crushing your body
      into jam jelly.
    BAD_POD_HEREDOC
    return :death
  else
    puts <<-GOOD_POD_HEREDOC
      The pod escapes out into the void of space, then
      the pod easily slides out into space heading to
      the planet below. As it flies to the planet, you look
      back and see your ship implode then explode like a
      bright star, taking out the Gothon ship at the same
      time. You won!
    GOOD_POD_HEREDOC
    # exit with code 0 to indicate player won
    Process.exit(0)
  end
end

# dictionay of method names
ROOMS = {
  :death => method(:death),
  :central_corridor => method(:central_corridor),
  :laser_weapon_armory => method(:laser_weapon_armory),
  :the_bridge => method(:the_bridge),
  :escape_pod => method(:escape_pod)
}

# runner runs the game loop.
# parameter map is a dictionary of method names
# parameter start is the initial method name
def runner(map, start)
  next_one = start

  while true
    puts "\n---------"
    # In the map dictionary use next_one as the key to look up a method name.
    # Assign method name to room.
    room = map[next_one]
    # Call the method assigned to room. 
    # When it returns, assign the return value to next_one.
    next_one = room.call()
    # Continue while loop
  end
end

# start the game loop using the ROOMS dictionary in the central corridor.
runner(ROOMS, :central_corridor)
