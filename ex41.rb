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
    puts "Quick on the draw you yank out your blaster and fire it at the Gothon."
    puts "His clown costom is flowing and moving around his body, which throws"
    puts "off your aim. Your laser hits his costume but misses him entirely. This"
    puts "makes him fly into an insane rage and blast you repeatedly in the face until"
    puts "you are dead. Then he eats you."
    return :death

  elsif action == "dodge!"
    puts "Like a world class boxer you dodge, weave, slip and slide right"
    puts "as the Gothon's blaster cranks a laser past your head."
    puts "In the middle of your artful dodge your foot slips and you"
    puts "bang your head on hte metal wall and pass out."
    puts "You wake up shortly after only to die as the Gothon stomps on"
    puts "your head and eats you."
    return :death

  elsif action == "tell a joke"
    puts "Lucky for you they made you learn Gothon insults in the academy."
    puts "You tell the one Gothon joke you know:"
    puts "Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr."
    puts "The Gothon stops, tries not to laugh, then busts out laughing and can't move."
    puts "While he's laughing you run up and shoot him square in the head"
    puts "putting him down, then jump through the Weapon Armory door."
    return :laser_weapon_armory

  else
    puts "DOES NOT COMPUTE!"
    return :central_corridor
  end
end

def laser_weapon_armory()
  puts "You do a dive roll into the Weapon Armory, crouch and scan the room"
  puts "for more Gothons that might be hiding. It's dead quiet, too quiet."
  puts "You stand up and run to the far side of the room and find the"
  puts "neutron bomb in its container. There's a keypad lock on the box"
  puts "and you need the code to get the bomb out. If you get the code"
  puts "wrong 10 times then the lock closes forever and you can't get the bomb. The code is 3 digits."

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
  puts "winning_combinations"
  pp winning_combinations

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
    puts "The container clicks open and the seal breaks, letting gas out."
    puts "You grab the neutron bomb and run as fast as you can to the"
    puts "bridge where you must place it in the right spot."
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
  puts "You burst onto the Bridge with the neutron destruct bomb"
  puts "under your arm and surprise 5 Gothons who are trying to"
  puts "take control of the ship. Each of them has an even uglier"
  puts "clown costume than the last> Tehy haven't pulled their"
  puts "weapons you tet, as they see the active bomb under your"
  puts "arm and don't want to set it off."

  prompt()
  action = gets.chomp()

  if action == "throw the bomb"
    puts "In a panic you throw the bomb at the group of Gothons"
    puts "and make a leap for the door. Right as you drop it a"
    puts "Gothon shoots you right in the back killing you."
    puts "As you die you see another Gothon frantically try to disarm"
    puts "the bomb. You die knowing they will probably blow up when"
    puts "it goes off."
    return :death

  elsif action == "slowly place the bomb"
    puts "You point your blaster at teh bomb under your arm"
    puts "and theGothons put their hands up and start to sweat."
    puts "You inch bacward to the door, open it, and then carefully"
    puts "place the bomb on the floor, pointing your blaster at it."
    puts "You then jump back hrough the door, punch the close button"
    puts "and blast the lock so the Gothons can't get out."
    puts "Now that the bomb is placed you run to the escape pod to"
    puts "et off this tin can."
    return :escape_pod

  else
    puts "DOES NOT COMPUTE!"
    return :the_bridge
  end
end

def escape_pod()
  puts "You rush through the sip desperately trying to make it to"
  puts "the escape pod before the whole ship explodes. It seems like"
  puts "hardly any Gothons are on the sip, so your run is clear of"
  puts "interference. You get to the chamber with the escape pods, and"
  puts "now need to pick one to take. Some of them could be damaged"
  puts "but you don't have time to look. There's 5 pods, which one"
  puts "do you take?"

  good_pod = rand(5)+1
  print "[pod #]>"
  guess = gets.chomp()

  if guess.to_i != good_pod
    puts "you jump into pod %s and hit the eject button." % guess
    puts "The pod escapes out into the void of space, then"
    puts "implodes as the hull ruptures, crushing your doby"
    puts "into jam jelly."
    return :death
  else
    puts "The pod escapes out into the void of space, then"
    puts "The pod easily slides out into space heading to"
    puts "the planet below. As it flies to the planet, you look"
    puts "back and see your ship implode then explode lik a"
    puts "bright star, taking out the Gothon ship at the same"
    puts "time. You won!"
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
