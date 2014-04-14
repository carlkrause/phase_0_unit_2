# U2.W5: Virus Predictor

# I worked on this challenge with Catherine Farkas.

# EXPLANATION OF require_relative
# loads the code from the file named 'state_data' (?why no filename extension?) 
# and raises and error if file isn't found
#
require_relative 'state_data' 

class VirusPredictor

  def initialize(state_of_origin, population_density, population, region, regional_spread) # Defines all arguments as instance variables
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  def virus_effects  # calling private methods and giving them the arguments, which are instance variables, 
    predicted_deaths(@population_density, @population, @state)
    speed_of_spread(@population_density, @state)
  end

  private  #what is this?  what happens if it were cut and pasted above the virus_effects method
  # => It would make virus_effects private, meaning it could not be called outside of the 
  # => class VirusPredictor. You could still call virus_effects from other methods that 
  # => have been defined in class VirusPredictor, but you could not choose to call the method 
  # => on an instance of the class. For example, you couldn't call virus_effects on Alabama 
  # => in the driver code (which would cause driver code to break).

  def predicted_deaths(population_density, population, state) # defining a method which takes three arguments, 
    # => and using an if-elsif tree to calculate number of deaths
    # => If population density falls within a particular range, multiply population by a value
    #    and round it down to the nearest integer.
    # => Use string interpolation to print string which includes state name and the number
    #    of deaths.
=begin
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else 
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
=end
    predictor = case @population_density
      when 0..50
        0.05
      when 50..100
        0.1
      when 100..150
        0.2
      when 150..200
        0.3
      else
        0.4
      end
    return (@population_density * predictor).floor
  end

  def speed_of_spread(population_density, state) #in months
    # defining a method and passing two arguments, setting default speed to 0.
    # If-elsif statements that use ranges for population density.  If a condition 
    # is met, it increments speed by a given value.
    # Prints the second part of a string and uses string interpolation to put 
    # speed into that string.
    speed = 0.0
=begin
    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else 
      speed += 2.5
    end
=end
  speed += case @population_density
    when 0..50
      2.5
    when 50..100
      2
    when 100..150
      1.5
    when 150..200
      1
    else
      .5
    end
    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
alaska.virus_effects