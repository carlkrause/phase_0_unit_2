# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: Objects of the Die class which include arrays of non-integer values.
# Output: Returns number of sides of dice and the value of rolled side.
# Steps:
# => DEFINE Die class
	# Initialize class with one argument, sides
		# Create instance variable of sides
		# IF @sides is equal to an empty array, RAISE an argument error
		#END
	#END
	#DEFINE method sides
		#RETURN instance variable of sides' length
	#END
	#DEFINE method roll
		#RETURN sample from @sides
	#END
#END

# 3. Initial Solution

class Die
  def initialize(sides)
    @sides = sides
    if @sides == []
      raise ArgumentError
    end
  end

  def sides
    return @sides.length
  end

  def roll
    return @sides.sample
  end
end


# 4. Refactored Solution

# => As with the last assignment, I'm happy with the result: it seems relatively DRY.




# 1. DRIVER TESTS GO BELOW THIS LINE

city_selector = Die.new(["Berlin","Chicago","Mexico City","Shanghai","Seoul","Buenos Aires","New York","San Francisco","Los Angeles","London","Barcelona","Paris"])
puts city_selector.sides.is_a?(Integer)
puts city_selector.roll.is_a?(String)
puts city_selector.sides == 12
puts ["Berlin","Chicago","Mexico City","Shanghai","Seoul","Buenos Aires","New York","San Francisco","Los Angeles","London","Barcelona","Paris"].include?(city_selector.roll)


# 5. Reflection 
# => I really "got" this right from the start. It was very similar to the first challenge and I already knew methods .length and .sample from previous weeks.
# => It took me a bit of time to write driver code that worked, but I'm content with what I put together.
# => I also liked adding in a personal touch--a "which city to visit" die--which made the exercise a little more fun.
