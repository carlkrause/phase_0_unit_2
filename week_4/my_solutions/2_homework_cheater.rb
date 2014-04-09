# U2.W4: Homework Cheater


# I worked on this challenge by myself.

=begin
User Stories: 
As a user, I want to
- Create a generic template
- Use the generic template (without overwriting it)
- Input a title into the template
- Identify and pass in a person/place/topic into the template
- Input an important date into the template
- Input my thesis statement into the template
- Output my finished template onto the screen
=end

# 2. Pseudocode

# Input: title, topic, date, thesis statement, and pronoun to be passed in
# Output: a string interpolated with the five values to be passed
# Steps:
# => DEFINE a method, essay_writer, and give five parameters
# => RETURN a string full of sweeping generalizations, interpolated with the five parameters
# => END
# => pass the strings and dates to the method; print

# 3. Initial Solution

def essay_writer(title, topic, date, thesis_statment, pronoun)
	return "#{title}: It is very important to consider the role of #{topic}. The events of #{date}--which #{pronoun} was a vital part of--illustrate #{topic}'s enduring legacy. #{thesis_statment} #{topic} is an intriguing part of the milieu of #{date} and remains an important touchstone to this day." 
end

p essay_writer("The First Shogun", "Tokugawa Ieyasu", 1603, "His most important contribution to history is that he founded the Tokugawa period, a peaceful time that lasted over 200 years.", "he") 

# My Award-Winning Essay (or maybe "D"-worthy)!

# "The First Shogun: It is very important to consider the role of Tokugawa Ieyasu. The events of 1603--which he was a vital part of--illustrate Tokugawa Ieyasu's enduring legacy. His most important contribution to history is that he founded the Tokugawa period, a peaceful time that lasted over 200 years. Tokugawa Ieyasu is an intriguing part of the milieu of 1603 and remains an important touchstone to this day."

# 4. Refactored Solution

class Ghostwriter
  def initialize(title, topic, date, thesis_statment, pronoun)
  	@title = title
  	@topic = topic
  	@date = date
  	@thesis_statment = thesis_statment
  	@pronoun = pronoun
  end

  attr_accessor :title, :topic, :date, :thesis_statment, :pronoun


  def essay_writer
	return "#{@title}: It is very important to consider the role of #{@topic}. The events of #{@date}--which #{@pronoun} was a part of--illustrate #{@topic}'s enduring legacy. #{@thesis_statment} #{@topic} is an intriguing part of the milieu of #{@date} and remains an important touchstone to this day." 
  end
end

essay_1=Ghostwriter.new("The First Shogun", "Tokugawa Ieyasu", 1603, "His most important contribution to history is that he founded the Tokugawa period, a peaceful time that lasted over 200 years.", "He") 
p essay_1.essay_writer
essay_2=Ghostwriter.new("He Made Art Pop", "Roy Lichtenstein", "the 1960s", "He was one of the most prominent proponents of Pop Art, a largely American art movement that marked a radical departure from Abstract Experessionism. His iconic benday dot paintings are widely recognized.", "he")
p essay_2.essay_writer
essay_3=Ghostwriter.new("Reconsidering Deliberative Democracy", "Chantal Mouffe", "the post-Cold War era in democratic theory", "Chantal draws on notions of Gramscian hegemony and Carl Schmitt's conception of the 'the political' to rearticulate a vision for the role of conflict in democratic societies.", "she")
p essay_3.essay_writer 

# 1. DRIVER TESTS GO BELOW THIS LINE
=begin

p essay_1.title == "The First Shogun"
p essay_1.topic == "Tokugawa Ieyasu"
p essay_1.date == 1603
p essay_1.thesis_statement == "His most important contribution to history is that he founded the Tokugawa period, a peaceful time that lasted over 200 years."
p essay_1.pronoun = "He"

p essay_2.title == "He Made Art Pop"
p essay_2.topic == "Roy Lichtenstein"
p essay_2.date == "the 1960s"
p essay_2.thesis_statement == He was one of the most prominent proponents of Pop Art, a largely American art movement that marked a radical departure from Abstract Experessionism. His iconic benday dot paintings are widely recognized."
p essay_2.pronoun = "He"

p essay_3.title == "Reconsidering Deliberative Democracy"
p essay_3.topic == "Chantal Mouffe"
p essay_3.date == "the post-Cold War era in democratic theory"
p essay_3.thesis_statement == "Chantal draws on notions of Gramscian hegemony and Carl Schmitt's conception of the 'the political' to rearticulate a vision for the role of conflict in democratic societies."
p essay_3.pronoun = "she"


# 5. Reflection 
# => I did this challenge after I'd already read about and watched videos detailing classes and class constructors.
# => This is a very similar concept to what we covered in the JS materials, so I found this fairly straightforward.
# => I did enjoy building this tool, though didn't have time to tackle the bonus portions.




