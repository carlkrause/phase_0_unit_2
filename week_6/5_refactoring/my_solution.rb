# U2.W6: Refactoring for Code Readability


# I worked on this challenge [by myself, with: ].


# Original Solution
=begin
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
=end
# Refactored Solution
class CreditCard
	attr_accessor :card_num
	def initialize(card_num)
		@card_num = card_num.to_s
		if @card_num.length !=16 then raise ArgumentError
		end
	end

	def multiply_by_two
		@card_num.split(//).reverse.each(&:to_i).each_with_index{ |i| card_num[i] *=2 if i.odd? }
	end

	def sum
		@card_num.join.split(//).map{|num| num.to_i}.inject(:+)
	end

	def check_card
		card_num.sum % 10 == 0 ? true : false
	end
end




# DRIVER TESTS GO BELOW THIS LINE

card = CreditCard.new(4408041234567892)
puts card.card_num.length
puts card.card_num.split(//).reverse.each(&:to_i).each_with_index{|i| @card_num[i] *= 2 if i % 2 != 0 }
puts card.multiply_by_two
card2 = CreditCard.new(4408041234567893)    


=begin
def assert
	yield
end
=end
#p assert {card2.check_card == true}
#p assert {card.check_card == false}



# Reflection
