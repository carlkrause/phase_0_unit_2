# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge by myself.


# Pseudocode
# => DEFINE class Song
	# Attribute accessors should include title and artist
	# => INITIALIZE with two paramters, title and artist
	# END
	# DEFINE method play
		# return string with string interpolation of title and artist
# => END

# DEFINE class Playlist
	# INITIALIZE method with one parameter, song with splat
		# Create empty array named playlist
		# Iterate over all songs and place into playlist array
	# END
	# DEFINE method add song taking one argument with splat operator
		# Iterate over all songs and place into playlist array
	# END
	# DEFINE method number of tracks
		# length of playlist array
	# END
	# DEFINE method remove song
		# takes one argument, song with splat
		# deletes specified song from array
	# END
	# DEFINE method include?
		# Playlist include? a song, returns true/false
	# DEFINE method, play all
		# iterate over array and use string interpolation to print artist and song
	# END
	# DEFINE method, display
		# iterate over array and use string interpolation to print artist and song

# => END

# Initial Solution
class Song

	attr_accessor :title, :artist

	def initialize(title, artist)
		@title = title
		@artist = artist
	end

	def play
		puts "Now playing #{@title} by #{@artist}."
	end
end

class Playlist

	def initialize(*song)
		@playlist = []
		song.each { |track| @playlist << track }
	end

	def add(*song)
		song.each { |track| @playlist << track }
	end

	def num_of_tracks
		@playlist.length
	end

	def remove(song)
		@playlist.delete(song)
	end

	def includes?(song)
		@playlist.include?(song)
	end

	def play_all
		puts "Playing the following songs: "
		@playlist.each { |x| puts "#{x.title} by #{x.artist}" }
	end

	def display
		puts "Here's your playlist: "
		@playlist.each { |x| puts "#{x.title} by #{x.artist}" }
	end

end




# Refactored Solution

# => It took a long time to get the play_all and display to print correctly. Nonetheless, I was able to keep it fairly concise--other than include?, I didn't have to add additional methods.




# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
 
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
puts my_playlist.display
puts my_playlist.num_of_tracks
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
my_playlist.includes?(lying_from_you) == true
puts my_playlist.play_all
puts my_playlist.display


def assert
	yield
end

p assert {my_playlist.class == Playlist}
p assert {angels.class == Song}
p assert {my_playlist.num_of_tracks == 4}


# Reflection
# => This took me a long time to accomplish, but it was well worth it.
# => Based on the driver code, I quickly was able to construct the two classes.
# => Where I struggled, however, was with the play_all and display methods. The concepts seemed straightforward,
# => however, I found that my method for adding songs to the array was not working as it should.
# => That prompted me to think through how to add songs and realized I needed to be interating over the songs to add them.
# => That opened up more doors, and after some experimentation, was able to use string interpolation to get it to print exactly the way I wanted.
# => Overall, activities like these that take a long time are the most helpful for my learning as it makes me really break
# => the problem down. I'm learning that the logic and thinking things through step by step is far more important than remembering certain methods (there's Google for that).