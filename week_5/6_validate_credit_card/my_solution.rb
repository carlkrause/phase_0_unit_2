# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: an instance of the CreditCard class with an integer as argument
# Output: true or false--validity of a credit card number
# Steps:
# => DEFINE class CreditCard
	# INITIALIZE with method that takes card number as argument
		# Make card number (converted to a string) available as an instance variable
		# IF the card number length does not equal 16, raise an argument error
	# END

	# DEFINE a method called check_card
		# create a new array which will hold: card number split into characters and reversed
		# convert array elements back to integers
		# create empty arrays for values at even and odd index values
		# iterate through the new array with number and index value as block variables
			# IF index variable is odd, double that integer and place it into array for odd index values
			# ELSE, place integer into array for even index values
			# END
		# create a new array to hold the odd index values
			# join the elements of the array, then separate them by character using string methods
			# convert the elements of array to integers
		# sum the values in the new array of odd index values and the elements in the even index values
		# IF the sum is divisible by 10,
			# return TRUE (it's a valid credit card number)
		# ELSE
			# return FALSE (it isn't a valid number)
		#END
	#END
#END

# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
class CreditCard
  def initialize(card_num)
    @card_num = card_num.to_s
    if @card_num.length != 16
      raise ArgumentError
    end
  end

  def check_card
    nums = @card_num.split(//).reverse.map {|num| num.to_i}
    doubled = []
    undoubled = []
    nums.each_with_index do |num, i|
      if i.odd?
        doubled << num*2
      else
        undoubled << num
      end
    end
    new_doubled = doubled.join.to_i.to_s.split(//).map {|num| num.to_i}
    sum = new_doubled.inject(:+) + undoubled.inject(:+)

    if sum % 10 == 0
      return true
    else
      return false
    end
  end
end

# 4. Refactored Solution

# => My initial solution is a verbose mess, but I'm under to gun to get this turned in by midnight, so refactoring will have to wait!




# 1. DRIVER TESTS GO BELOW THIS LINE
card = CreditCard.new(4408041234567892)
puts card.check_card == false
card = CreditCard.new(4408041234567893)    
puts card.check_card == true




# 5. Reflection 
# => This took me a long time to work through. The comforting part was that thinking up the code wasn't too hard; I only had to do a minimal amount of research.
# => What I should have done, however, is read over the Luhn Algorithm once more when thinking out my strategy--I kept testing and testing and getting only one error.
# => After making small changes here and there for 90 minutes, I went back to Wikipedia and found that I should have been splitting the doubled values! Ugh.
# => Once I figured that out I finished quickly. It's a reminder that I need to collect all the information and think things through 110% before diving in...