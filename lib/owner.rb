require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  @@owner_count = 0
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
    @@owner_count += 1
  end
  
  def say_species
    "I am a #{self.species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@owner_count
  end
  
  def self.reset_all
    @@all.clear
    @@owner_count = 0
  end
  
  def cats
    Cat.all.select{|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
end