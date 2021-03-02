# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

# test code goes here


# gym
g1 = Gym.new("Angy Amber's Armpit")
g2 = Gym.new("Beefy Jeefy's Keef")
g3 = Gym.new("Free the Pits")
g4 = Gym.new("Over 9000 Gym")

# lifter
l1 = Lifter.new("Killmonger", 450)
l2 = Lifter.new("Batman", 5000)
l3 = Lifter.new("Goku", 9001)

# membership
m1 = Membership.new(35, g1, l1)
m2 = Membership.new(200, g2, l1)
m3 = Membership.new(500, g1, l2)
m4 = Membership.new(40, g2, l2)
m5 = Membership.new(300, g3, l2)
m6 = Membership.new(10000, g4, l3)
m7 = Membership.new(20, g1, l3)
m7 = Membership.new(50, g2, l3)
m8 = Membership.new(40, g3, l3)

# in hindsight, i should prolly stick to less objects just to save time.

binding.pry

puts "Gains!"
