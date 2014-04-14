# U2.W5: Bakery Challenge GPS

# I worked on this challenge with: 

# => Rick Dsida

# Our Refactored Solution

def bakery_num(num_of_people, fav_food) 
  serving_size = {"pie" => 8, "cake" => 6, "cookie" => 1} # establishes hash which describes serving size for each baked good
  quantity_needed = {
      "pie" => 0,
      "cake"=> 0,
      "cookie"=> 0
  }
 
#
  if serving_size.has_key?(fav_food) == false
       raise ArgumentError.new("You can't make that food")
  end

        if num_of_people > serving_size[fav_food]
            quantity_needed[fav_food] = num_of_people / serving_size[fav_food]
            num_of_people = num_of_people % serving_size[fav_food]
        end
        while num_of_people > 0
                if num_of_people / serving_size["pie"] > 0 # if serving size of pie goes into number of people
                    quantity_needed["pie"] += num_of_people / serving_size["pie"] # determines how many pies to make
                    num_of_people = num_of_people % serving_size["pie"] # how many people are left hungry
                elsif num_of_people / serving_size["cake"] > 0 # takes new number of hungry people
                    quantity_needed["cake"] += num_of_people / serving_size["cake"]
                    num_of_people = num_of_people % serving_size["cake"] # finds new value of remaining hungry people
                else
                    quantity_needed["cookie"] = num_of_people # everybody else gets cookies
                    num_of_people = 0 # everybody has received something; while loop ends
                end
            end
            return "You need to make #{quantity_needed["pie"]} pie(s), #{quantity_needed["cake"]} cake(s), and #{quantity_needed["cookie"]} cookie(s)." # returns quantities of baked goods we need to make in a string
        

end

#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!




#  Reflection 

# => I was very happy with how our GPS went. We were able to identify what was going on (and how messed up that bakery is).
	# Overall, Rick and I worked well together: switching back and forth between driving and navigating, sharing resources, and making helpful suggestions.
	# While we didn't have a ton of time to come up with something more elegant, I'm happy we got something workable in short order.

