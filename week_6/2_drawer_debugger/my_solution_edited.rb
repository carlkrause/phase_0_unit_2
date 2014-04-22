# U2.W6: Drawer Debugger


# I worked on this challenge [by myself, with: ].


# 2. Original Code

class Drawer
	attr_reader :contents

# Are there any more methods needed in this class?

	def initialize
		@contents = []
		@open = true
	end

	def open
		@open = true
	end

	def close
		@open = false
	end 

	def add_item(item)
		@contents << item
	end

	def remove_item(item = @contents.pop) #what is `#pop` doing?
		@contents.delete(item)
	end

	def dump  # what should this method return?
		@contents.clear
		puts "Your drawer is empty."
	end

	def view_contents
		puts "The drawer contains:"
		@contents.each {|silverware| puts "- " + silverware.type }
	end
end

class Silverware
	attr_reader :type

# Are there any more methods needed in this class?
# => Yes, clean_silverware

	def initialize(type, clean = true)
		@type = type
		@clean = clean
	end

	def clean_silverware
		@clean = true
	end

	def clean
		@clean
	end

	def eat
		puts "eating with the #{type}"
		@clean = false
	end

end

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
knife1 = Silverware.new("knife")
silverware_drawer.add_item(knife1)
spoon = Silverware.new("spoon")
silverware_drawer.add_item(spoon)
fork = Silverware.new("fork")
silverware_drawer.add_item(fork) 
silverware_drawer.view_contents

# removed silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

silverware_drawer.remove_item(sharp_knife)
sharp_knife.eat
sharp_knife.clean_silverware
silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return? # => This should not return anything--the array is empty after we dumped it.

fork.clean_silverware
silverware_drawer.add_item(fork)
silverware_drawer.remove_item(fork) #add some puts statements to help you trace through the code...
fork.eat

fork.clean_silverware
silverware_drawer.add_item(fork)
silverware_drawer.view_contents

spoon.clean_silverware
silverware_drawer.add_item(spoon)
silverware_drawer.view_contents

#BONUS SECTION
puts fork.clean

# DRIVER TESTS GO BELOW THIS LINE

def assert
	yield
end

p assert {spoon.clean == true}
p assert {fork.eat == fork.clean}
p assert {spoon.class == Silverware}
p assert {silverware_drawer.class == Drawer}




# 5. Reflection
# => Overall I enjoyed this activity. Having to understand how the code works
# => and then modifying the methods to complete the procedure was good practice.
# => It was also good practice writing assert statements, which I'm starting to
# => see the value of (takes less time than writing driver code because we can just pass the blocks).
# => I'd like to do more exercises like this, both to practice writing asserts, but also in
# => understanding and modifying existing code.