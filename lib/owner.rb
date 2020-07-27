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
    @@pets.select {|pets| pets.Class == Cat}
  end
  
  def buy_cat
    new_cat = Cat.new
    @@pets << new_cat
  end
  
  def dogs
    @@pets.select {|pets| pets.Class == Dog}
  end
  
  def buy_dog
    new_dog = Dog.new
    @@pets.dogs << new_dog
  end
  
end
  

   