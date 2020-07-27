class Owner
  # code goes here
  #attr_accessor :name 
  @@all = []
  @@owners = []
  @@pets = {:dogs => [], :cats => []}
  
  attr_reader :species, :name
  def initialize(name)
   @name = name 
   @species = "human" 
   save
   @@owners << self
  end 
  def say_species
     "I am a #{@species}."
  end 
  def save
    @@all << self
  end 
  def self.all 
    @@all << self 
  end 
  def self.count
    @@owners.length 
  end 
  def self.reset_all
    @@owners = []
  end 
  
  def cats
    Cat.all.select {|cats| cats.owner == self}
  end
  
  def buy_cat(cat)
     @@pets[:cats] << Cat.new(cat, self)
  end
  
  def dogs
    Dog.all.select {|dogs| dogs.owner == self}
  end
  
  def buy_dog(dog)
     @@pets[:dogs] << Dog.new(dog, self)
  end
  
  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end
  
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    
  end
  
  def sell_pets
    cats.mood = "nervous"
    dogs.mood = "nervous"
    cats.owner = ""
    dogs.owner = ""
    
  end
  
end
  

   