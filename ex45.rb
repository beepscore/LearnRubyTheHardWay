#!/usr/bin/env ruby
## Animal is-a object (yes, sort of confusing) look at the extra credit
class Animal

end

## Dog is an Animal, it subclasses Animal
# http://rubylearning.com/satishtalim/ruby_inheritance.html
class Dog < Animal

  def initialize(name)
    ## ??
    @name = name
  end

end

## Cat is an Animal, it subclasses Animal
class Cat < Animal

  def initialize(name)
    ## ??
    @name = name
  end

end

## Person is a class
class Person

  attr_accessor :pet

  def initialize(name)
    ## person object has-a name
    @name = name

    ## Person has-a pet of some kind
    @pet = nil
  end

end
## Employee is a class, it subclasses Person
class Employee < Person

  def initialize(name, salary)
    ## ?? hmm what is this strange magic?
    # call super class Person method name??
    super(name)
    ## Instance variable - an Employee has a salary
    @salary = salary
  end

end

## Fish is a class
class Fish

end

## Salmon is a class, it subclasses Fish
class Salmon < Fish

end

## Halibut is a class, it subclasses Fish
class Halibut < Fish

end

## rover is-a Dog. Also he is an Animal.
rover = Dog.new("Rover")

## satan is a Cat. Also he is an Animal.
satan = Cat.new("Satan")

## mary is a Person
mary = Person.new("Mary")

## mary has a pet- satan
mary.pet = satan

## frank is an object, an instance of Employee. frank has a name Frank and a salary 120000 
frank = Employee.new("Frank", 120000)

## frank has a pet rover
frank.pet = rover

## flipper is an object, an instance of Fish. flipper is also an instance of an Animal.
flipper = Fish.new

## crouse is an object, an instance of Salmon.
crouse = Salmon.new

## harry is an object, an instance of Halibut.
harry = Halibut.new
