# U2.W4: Reverse Cipher Challenge


# I worked on this challenge by myself.


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence) # This defines the method and parameter
    alphabet = ('a'..'z').to_a # this creates an array named alphabet using a string range function
    cipher = Hash[alphabet.zip(alphabet.rotate(4))] # zips alphabet and a rotated alphabet (wheeling it so index values shift by 4) into a new hash
    spaces = ["@", "#", "$", "%", "^", "&", "*"] # defines an array with string values for spaces
    
    original_sentence = sentence.downcase # makes sentence lowercase
    encoded_sentence = [] # creates an empty array to hold the values that will be passed later
    original_sentence.each_char do |element| # iterates over each individual character key
      if cipher.include?(element) # if the cipher includes that particular key...
        encoded_sentence << cipher[element] # put the value into the encoded sentence array
      elsif element == ' ' # otherwise, if there's an empty space
        encoded_sentence << spaces.sample # pluck an array element form the spaces element at random and put it in the sentence
      else 
        encoded_sentence << element # else, just put the element into the sentence
      end
     end
    
    return encoded_sentence.join # return the array elements joined
end


# Questions:
# 1. What is the .to_a method doing?
# => .to_a is making the alphabetical range into an array
# 2. How does the rotate method work? What does it work on?
# => Rotate takes the index value it is fed and starts the array there, placing previously lower indexed values at the end of the array.
# 3. What is `each_char` doing?
# => Looping over each individual character
# 4. What does `sample` do?
# => The sample method takes one (or more, if specified) array value at random and returns it.
# 5. Are there any other methods you want to understand better?
# => These are all very cool. I learned about join and zip previously; I think .sample is of particular interest to me. Lotto!
# 6. Does this code look better or worse than your refactored solution of the original cipher code? What's better? What's worse?
# => Better for sure mostly because it is more concise.
# 7. Is this good code? What makes it good? What makes it bad?
# => Maybe because I've been thinking of code that addresses this, it seems great!


# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
# => Yes.
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")





# 5. Reflection 
# => Going over this felt much more familiar then when I glanced at it a week ago, which feels great.
# => The list of methods I feel comfortable with has grown from .each to a dozen or more now, which feels good.
