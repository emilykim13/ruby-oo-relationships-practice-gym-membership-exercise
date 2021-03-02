class Lifter
  attr_reader :name, :lift_total
  @@all = []
  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships # >>>Get a list of all the memberships that a specific lifter has<<<
    Membership.all.select {|object| object.lifter == self}
      # 1- we want a list of all the memberships that a lifter subscribes to so we're going to be calling objects from the Membership class
      # 2- we use Membership.all to access the list of all memberships in existence
      # 3- i use .select bc i like conditionals. .select returns a new array, the elements inside it have to 'pass' a condition (they have to be truthy)
      # 4- i use == (comparison symbol) to compare the object.lifter to self
            # im comparing object.lifter to self bc this is written in the class Lifter so self=Lifter. 
            # Therefore if object.lifer = self, then a truth value returns our lifter's Membership as an object.
  end

  def gyms # >>>Get a list of all the gyms that a specific lifter has memberships to<<<
    self.memberships.map {|object| object.gym} #object = membership (doesnt matter what we put as our block)
      # 1- we want a list of gyms that our lifter has a membership to so we are 'reusing' an instance method we made in line 14
      # 2- im using .map bc i want be able to have many outputs and mainly bc i want to manipulate the array to ONLY return the gym 
      # 3- object.gym; loosely, we can say our object is a membership instance; we want the gym name from our membership data pool 
            # notice in "self.memberships.map" we're calling a method 'memberships', that's where our 'object' comes from
  end

  def self.average_lift #>>>Get the average lift total of all lifters<<<
    lift_array = @@all.map {|object| object.lift_total}
    lift_array.inject{|var1, var2| var1 += var2}.to_f/lift_array.size
  end
  # i dont even wanna try to explain this one. tbh im being extra by using .inject

    # here's a much easier and user-friendly method that does the exact same thing
  # def self.average_lift_total
  #   @@all.sum{|lifter|  lifter.lift_total.to_f}/@@all.size.to_f
  # end

  def gyms_cost # >>>Get the total cost of a specific lifter's gym memberships<<<
    cost_array = self.memberships.map {|object| object.cost}
    cost_array.inject{|var1, var2| var1 += var2}
  end

  def add_lifter(cost, gym) # >>>Given a gym and a membership cost, sign a specific lifter up for a new gym<<<
    Membership.new(cost, gym, self)
  end

end