# U2.W5: Die Class 1: Numeric


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: An object of Die class with an integer parameter that is 1 or greater
# Output: When passed the parameter, it will return the number of sides at initialization as well as a random "rolled" value in the range.
# Steps:
# => DEFINE a class Die
	# DEFINE initialize method with single sides argument
		# Create an instance variable of sides
		# IF @sides is less than 1
			# RAISE an argument error
		# END
	#END
	# DEFINE sides method that will take the passed value and return it
		# RETURN @sides
	#END
	# DEFINE a roll method which returns a random value in a range of 1-number of sides
		# RETURN random integer in range
	#END
#END

# 3. Initial Solution

class Die
  def initialize(sides)
    @sides = sides
    if @sides < 1
      raise ArgumentError
    end
  end

  def sides
    return @sides
  end

  def roll
    return rand(1..@sides)
  end
end

die_1 = Die.new(64)
puts die_1.sides
puts die_1.roll

# 4. Refactored Solution
# => I'm happy with my initial solution--it seems DRY enough.





# 1. DRIVER TESTS GO BELOW THIS LINE
test_die = Die.new(24)
puts test_die.roll.is_a?(Integer)
puts test_die.sides == 24
puts (test_die.roll).between?(1,24)





# 5. Reflection 

# => This week I watched and typed along to screencasts and tutorials and it helped immensely. I also did a peer-pairing session with Catherine on #4 and #5, which made this challenge seem much easier.
# => I'm getting much better at navigating between Sublime and Terminal and it is speeding up my process. I was able to pass the tests quickly when I realized all "sides" mentions needed to be instance variables.
# => Overall, I really like working with classes--for whatever reason it doesn't seem as abstract to me.