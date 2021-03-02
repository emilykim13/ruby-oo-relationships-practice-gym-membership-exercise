class Gym
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships # >>>Get a list of all memberships at a specific gym<<<
    Membership.all.select {|object| object.gym == self}
  end

  def lifters # >>>Get a list of all the lifters that have a membership to a specific gym<<<
    self.memberships.map {|object| object.lifter}
  end

  def lifters_name # >>>Get a list of the names of all lifters that have a membership to that gym<<<
    self.lifters.map {|object| object.name}
  end
  
  def gym_lift_total # >>>Get the combined lift total of every lifter has a membership to that gym<<<
    lift_array = lifters.map {|object| object.lift_total}
    lift_array.inject{|var1, var2| var1 += var2}
  end

end

