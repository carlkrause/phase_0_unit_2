# U2.W4: Separate Numbers with Commas


# I worked on this challenge by myself

# 2. Pseudocode

# Input: Integers of variable length passed to the separate_comma method
# Output: A string that is equivalent to the integer with commas inserted
# Steps:

# => DEFINE a method, separate_comma and use "number" as the parameter
	# create a new variable and define it as the number converted to a string
	# With the new variable, convert each character to an array (so we can use the each_slice method), reverse, then use the each_slide method and have it slice after every third value
	# Map the new variable and create a proc that will permit .map to use the join method
	# Join the sub-arrays containing each character with a comma
	# Reverse
	# END


# 3. Initial Solution

def separate_comma(number)
   newnum = number.to_s.chars.to_a.reverse.each_slice(3)
   newnum.map(&:join).join(",").reverse
end

# 4. Refactored Solution

# => I couldn't finesse a working solution until I came to the one above, but I like that it is relatively short and also employs a proc.






# 1. DRIVER TESTS GO BELOW THIS LINE

def random_num(min, max)
   rand(max - min + 1) + min
end

describe "seperate_comma" do
   it "returns no comma, when the integer is smaller than 1000" do
      separate_comma(random_num(0, 999)).should match /^\d{1,3}$/
   end
   it "returns one comma, when the integer is between 1000 and 999999" do
      separate_comma(random_num(1000, 999999)).should match /^\d{1,3},\d{3}$/
   end
   it "returns two commas, when the integer is between 1000000 and 999999999" do
      separate_comma(random_num(1000000, 999999999)).should match /^\d{1,3},\d{3},\d{3}$/
   end
end


# 5. Reflection 

# => This was a challenge because, after experimenting for a very long time with methods I knew (to no avail) n\, I forced myself to look at examples and then learn more about procs and lambdas.
	# Lana Rakhman had shared several videos earlier in the week about procs and lambdas, which turned out to be n\so, so helpful in understanding the workable solutions I found online after struggling on my own for a long time. \nI learned that array methods like .map don't play nice with other methods like .join, so it's necessary to create blocks or procs in order to, for example, join sub-arrays with commas.
	# Admittedly it took a lot of research and trial-and-error to get to this point and my command of procs and lambdas is not very strong, but this challenge forced me to confront that shortcoming.
	# Overall, I think it is so cool that one can create a proc in place. I hope to learn more about this and practice using it more in the near future.




