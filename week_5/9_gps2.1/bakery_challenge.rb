# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1) Carl Krause
# 2) Rick Dsida

 # This is the file you should end up editing. 
# Inputs: number of people will be a number and fav_food is a string
# Outputs: Returns string that indicates number of specific items that need to be made



def old_bakery_num(num_of_people, fav_food) 
  serving_size = {"pie" => 8, "cake" => 6, "cookie" => 1} # establishes hash which describes serving size for each baked good
  pie_qty = 0 # sets quantities needed to zero
  cake_qty = 0 # sets quantities needed to zero
  cookie_qty = 0 # sets quantities needed to zero
  
  has_fave = false # sets has_fave to false
#
  serving_size.each_key do |k| # loops over the hash 
    if k == fav_food # if key matches favorite food entered
        has_fave = true # has_fave is true
        fav_food = k # sets key to be value of favorite food
    end
  end
  
  if has_fave == false # if fave is something that isn't in inventory
    raise ArgumentError.new("You can't make that food") # throws an error if fave isn't an item sold
  else # if it doesn't have a false value for favorite food, do the following:
    fav_food_qty = serving_size.values_at(fav_food)[0] # returns the serving size from original hash (serving_size)
        if num_of_people % fav_food_qty == 0 # if the number of people is evenly divisible by the serving size of the baked good, do:
            num_of_food = num_of_people / fav_food_qty # how many baked goods need to be made to feed number of people
            return "You need to make #{num_of_food} #{fav_food}(s)." # uses string interpolation to put number of baked noods needed into string
        else num_of_people % fav_food_qty != 0 # if it isn't evenly divisible:
            while num_of_people > 0 # creates a loop so if number of people:
                if num_of_people / serving_size["pie"] > 0 # if serving size of pie goes into number of people
                    pie_qty = num_of_people / serving_size["pie"] # determines how many pies to make
                    num_of_people = num_of_people % serving_size["pie"] # how many people are left hungry
                elsif num_of_people / serving_size["cake"] > 0 # takes new number of hungry people
                    cake_qty = num_of_people / serving_size["cake"] # if number of people is greater than serving size of cake, it makes cake to accommodate
                    num_of_people = num_of_people % serving_size["cake"] # finds new value of remaining hungry people
                else
                    cookie_qty = num_of_people # everybody else gets cookies
                    num_of_people = 0 # everybody has received something; while loop ends
                end
            end
            return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)." # returns quantities of baked goods we need to make in a string
        end
  end
end
 

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
 # One where option to do without fav_food.  If none is entered then it will return the without preference (work in progress


def sbakery_num(num_of_people, fav_food = false) 
  serving_size = {"pie" => 8, "cake" => 6, "cookie" => 1} # establishes hash which describes serving size for each baked good
  quantity_needed = {
      "pie" => 0,
      "cake"=> 0,
      "cookie"=> 0
  }
 
    
    if serving_size.has_key?(fav_food) == false
       raise ArgumentError.new("You can't make that food")
    end
    if fav_food != false
        if num_of_people > serving_size[fav_food]
            quantity_needed[fav_food] = num_of_people / serving_size[fav_food]
            num_of_people = num_of_people % serving_size[fav_food]
        end
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
 
#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!
 
 
