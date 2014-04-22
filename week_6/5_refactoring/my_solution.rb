# U2.W6: Refactoring for Code Readability


# I worked on this challenge by myself on my original code.


# Original Solution
=begin
class CreditCard
  def initialize(card_num)
    @card_num = card_num.to_s
    if @card_num.length != 16
      raise ArgumentError
    end
  end

# => This class definition is pretty good--it's relatively concise and clear what's happening:
# => we're taking the argument, converting it to a string, and testing the length. We're also raising
# => an argument error before we continue if the string length is not 16.

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
=end

# => This whole check card method is a mess in retrospect. At the time I wrote the original code
# => I didn't understand that more, yet simpler, methods were generally better (because of the important human-to-human aspect surrounding readability).
# => I realized that what I'd done could be broken into four separate methods: nums (creating an array with values that are split and then converted to integers),
# => doubled (doubling the at even index values, joining then splitting all values via string conversion, then splitting them again and converting to integers),
# => sum (takes output of doubled method and sums it), and finally check_card (takes output of sum method and returns true or false if sum is divisible by 10).

# Refactored Solution

class CreditCard
	def initialize(card_num)
	    @card_num = card_num.to_s
	    if @card_num.length != 16
	      raise ArgumentError
	    end
	end

	def nums
		@card_num.split(//).map {|num| num.to_i}
	end

    def doubled
    	doubled_nums = nums
    	doubled_nums.each_index { |i| doubled_nums[i] *= 2 if i.even? }.join.to_s.split(//).map {|num| num.to_i}
    end

	def sum
		doubled.inject(:+)
	end

	def check_card 
    	sum % 10 == 0 ? true : false
    end
end

# DRIVER TESTS GO BELOW THIS LINE

card = CreditCard.new(4408041234567892)
card2 = CreditCard.new(4408041234567893)    
card3 = CreditCard.new(1035845833332234)
card4 = CreditCard.new(8457105288832221)


def assert
	yield
end

p assert {card2.check_card == true}
p assert {card.check_card == false}
p assert {card3.check_card == false}
p assert {card4.check_card == true}



# Reflection
# => This was also quite time-intensive, but I learned an immense amount from refactoring my code to be more readable.
# => What previously had been this massive, unreadable mess became much more digestible, even if the character count is roughly the same.
# => It is important to remember because refactoring my original solution was more complicated and exhausting than refactoring or modifying the new solution likely is.