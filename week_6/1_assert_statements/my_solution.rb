# U2.W6: Testing Assert Statements

# I worked on this challenge by myself.


# 2. Review the simple assert statement
=begin
def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
assert { name == "bettysue" }
assert { name == "billybob" }
=end
# 2. Pseudocode what happens when the code above runs
# => DEFINE assert method
	# RAISE "Assertion failed!" unless the name passed in from block is equivalent to "bettysue"
	# END method
# => Outside of method, a variable, name, is defined as string "bettysue"
	# A method call is made with the block; will return boolean true or false if name is equivalent to "bettysue"
	# A method call is made with the block; will return boolean true or false if name is equivalent to "billybob"
# => The error is raised for the method call with "billybob"--it wasn't raised with "bettysue" because 

# 3. Copy your selected challenge here

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

# 4. Convert your driver test code from that challenge into Assert Statements
city_selector = Die.new(["Berlin","Chicago","Mexico City","Shanghai","New York","San Francisco"])
=begin
puts city_selector.sides.is_a?(Integer)
puts city_selector.roll.is_a?(String)
puts city_selector.sides == 6
puts ["Berlin","Chicago","Mexico City","Shanghai","New York","San Francisco"].include?(city_selector.roll)
=end

def assert
  raise "Assertion failed!" unless yield
end

assert {city_selector.sides.is_a?(Integer)}
assert {city_selector.roll.is_a?(String)}
assert {city_selector.sides == 6}
assert {["Berlin","Chicago","Mexico City","Shanghai","New York","San Francisco"].include?(city_selector.roll)}


# 5. Reflection
# => This challenge was straightforward. It offered a good opportunity to review blocks/procs/lambdas.
# => While I see how asserts work, I'm not sure I understand the advantage of them over the driver code we've created in the last weeks.
# => I read up a bit about unit testing and I'd definitely like to see some examples of this in action. I also think working through a project with someone more experienced will help.
