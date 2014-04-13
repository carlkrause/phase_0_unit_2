# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: A new object of the GuessingGame class which contains one argument: an integer that's the correct answer.
# Output: If guessed integer does not match the answer, the loop continues until it outputs a "correct" response.
# Steps:
# => DEFINE a class called GuessingGame
	# INITIALIZE by creating an initialize method that takes one argument, answer
		# make the answer equivalent to an instance variable @answer
		# END
	# DEFINE a method called guess, which takes one argument, guess
		# translate the guess to an instance variable @guess
		# create a LOOP
			# IF @guess equals @answer, RETURN :correct
			# ELSIF if @guess is greater than the @answer, return :high
			# ELSE return :low
		# END loop
		# END
	# DEFINE a method, solved? to determine if correct answer has been found
		# IF @guess is equivalent to the @answer, return TRUE
		# ELSE return FALSE
	# END
	# END


# 3. Initial Solution

class GuessingGame
  def initialize(answer)
    @answer = answer
  end

  def guess(guess)
    @guess = guess
    loop do
      if @guess == @answer
        return :correct
      elsif @guess > @answer
        return :high
      else
        return :low
      end
    end
  end

  def solved?
    if @guess == @answer
      return true
    else
      return false
    end
  end
end

# 4. Refactored Solution

# => I'd like to return to this later to tighten it up a bit. I think using case could make the guess method a little more DRY and I suppose I could add some strings and string interpolation to make it more interesting.


# 1. DRIVER TESTS GO BELOW THIS LINE
game = GuessingGame.new(7)
puts game.guess(9) == :high
puts game.guess(2) == :low
puts game.guess(7) == :correct
puts game.solved?


# 5. Reflection 
# => This activity was helpful in solidifying my understanding of what instance variables do.
# => I was proud of myself--I did this without any research and just by experimenting, which made me feel pretty good.
# => I'd like to return to this exercise to add in gets later--it seems like I could add a lot of functionality later.
