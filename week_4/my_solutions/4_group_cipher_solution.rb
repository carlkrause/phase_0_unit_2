# U2.W4: Cipher Challenge


# I worked on this challenge with Mike Daugherty



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.



# => This line defines a method "north_korean_cipher" and its parameter (coded_message)
def north_korean_cipher(coded_message)
  # => This defines a variable "input"; "input" takes the coded message, makes it all lowercase, then splits each element (using quotation marks without a space a delimiter, which comma-separates each character, each surrounded by quotation marks)
  input = coded_message.downcase.split("")
  # => This creates a new empty array, which values will be added to later
  decoded_sentence = []
  # => This creates a hash with the key as the coded character and the value as the target character
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c", 
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
            
  # => This line takes the characters we comma-separated above and says to loop over the array we created to test if characters are matches; it's also creating a new block, x
  input.each do |x| # What is #each doing here?
    # => This line creates a new variable, found_match, which is equivalent to false
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
    cipher.each_key do |y| # each_key is looping through the cipher hash and plucking out the keys; to each, it will do y
      if x == y  # This is saying that if the coded message character matches the hash key character do the following:
        puts "I am comparing x and y. X is #{x} and Y is #{y}." # This seems like kind of a waste--all it does is say that the coded message character maps to a character in the hash.
        decoded_sentence << cipher[y] # This creates a new array, decoded_sentence, and inserts the hash key into it
        found_match = true # This is confirming that there was a match between a coded message character and a hash key. Basically, that the hash keys are letters like the coded message.
        break  # It's breaking here because the code is telling it that if the characters match, to break out of the code.
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" # This is saying that if a coded message character is one of the following do:
        decoded_sentence << " " # put an empty space into the decoded sentence array
        found_match = true # if a match is found, break out
        break
      elsif (0..9).to_a.include?(x) # This puts the values 0 up to and including 9 into an array; if the array matches a character from the coded message:
        decoded_sentence << x # put the value into the decoded_sentence array
        found_match = true # this seems pointless
        break
      end 
    end
    if not found_match  # This is saying that if a letter, symbol, or number 0-9 doesn't match the character, just put the character in the new array
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("") # this takes the new sentence and joins the elements with a space between them
 
  if decoded_sentence.match(/\d+/) # This says if there are one or more matches in the array for d
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } # Permanently divide d value (changed to integer) by 100
  end  
  return decoded_sentence # Returns the array we inserted values into  
end

# Your Refactored Solution

def north_korean_cipher(coded_message)
  input = coded_message.split("")
  decoded_sentence = []
  cipher = Hash[(("a".."z").to_a).rotate(4).zip(("a".."z").to_a)]


  input.each do |char|
    if cipher.include?(char)
      decoded_sentence << cipher[char]
    elsif ["@","#","$","%","^","&","*"].include?(char)
      decoded_sentence << " "
    else
      decoded_sentence << char
    end
  end
  
  decoded_sentence = decoded_sentence.join("")
  decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 }
  
  return decoded_sentence   
end

# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"


# Reflection
 # => Mike and I had a limited amount of time to pair, so we focused on what the code was doing. It was very helpful to think through the flow: how did the characters from the coded messages eventually get spit out in English?
 # => Working through the rest of the challenge alone, I really fixated on trying to make it as concise as possible. I cut out unneccesary elements like printing the "I'm doing this blah blah blah" and other things like .downcase.
 # => The discovery of how to zip a hash was big: I had been trying to mess with index values of an array and it just wasn't working.
 # => I also was pleased to discover ranges for letters ("a".."z"). Definitely a good thing to remember.
 # => I kept getting the original coded message and was baffled. I went through what I thought were problem areas in the block, but it turned out I had a space between the quotation marks in .split. . . You live, you learn.
 # => Refactoring was time-intensive, but I feel like I really got a handle on what everything is doing in this challenge.