class Membership
  attr_reader :cost, :gym, :lifter
  @@all = []
# add a 'gym' and a 'lifter' parameter and set them up for initialize since membership belongs to both Lifter class and Gym class

  def initialize(cost, gym, lifter)
    @cost = cost
    @gym = gym
    @lifter = lifter
    @@all << self
  end

  def self.all
    @@all
  end

end