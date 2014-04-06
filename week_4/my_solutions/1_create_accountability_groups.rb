# U2.W4: Accountability Group Creator


# I worked on this challenge by myself

# 2. Pseudocode

# Input: Array containing mames (strings) of members of Fireflies group
# Output: Groups of 4, additional "overhang" group of less than four people
# Steps:
# => DEFINE method acct_groups with parameter "boots"
	# 3 times DO
		# Shuffle elements in the array
		# Slice array into groups of four and create sub-array for each group
		# For each sub-array, puts "This group includes" + name of boots in group + "."
	#end

# 3. Initial Solution

boots = ["Ahmed Al-Bahar", "Alexander Glassman", "Brendan Brown", "Caleb Rugg", "Carl Krause", "Catherine Farkas", "Chase Miller", "Daniel Yoachim", "Keenan Turner", "Kim Girard", "Lana Rakhman", "Michael E Daugherty", "Michael Pourhadi", "Natalie Frecka", "Natalie McCroy", "Peter Debelak", "Richard Dsida", "Scott Silveus", "Travis Hernandez", "Tyler Keating", "Zac Mitton"]

def acct_groups(boots)
	3.times do
		new_group = boots.shuffle.each_slice(4).to_a
		new_group.each { |person| puts "This group includes: #{person.join(', ')}." }
		puts "---"
	end
end

acct_groups(boots)


# 4. Refactored Solution

# => If I have more time, I'd like to return to this and find creative ways to re-allocate the remainders to other groups. \nInitially I missed the step of converting the shuffled slices to array and got hung up on that for awhile. n\Overall I had some more time to use trial and error and it's my hope that I can refactor this to include methods like .map to make it a little more concise.






# 1. DRIVER TESTS GO BELOW THIS LINE

new_group != boots
puts new_group[0..4].length == 4
puts new_group[5].length == 1

# 5. Reflection 





