# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge with Catherine Farkas.

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode
#   Inputs: Array of arrays with single character elements ("a".."z")
#   Output: single string composed of characters taken from arrays

#   Part 1:
    # DEFINE method create_word; with two arguments--board, and one of which has unspecified number of inputs
    # It is iterating over board array and accessing each element at the coordinates
    # Returns character at coordinates, joined into a single string with no spaces between characters
    # END
    
    
# Initial Solution
=begin
def create_word(board, *coords)
    coords.map { |coord| board[coord.first][coord.last]}.join("")
end

  puts create_word(boggle_board, [2,1], [1,1], [1,2], [0,3])  #=> returns "code" 
  puts create_word(boggle_board, [0,1], [0,2], [1,2])  #=> creates what california slang word?
=end

# Refactored Solution
class Boggle
    def initialize(board)
        @board = board
    end
    def create_word(*coords)
        coords.map { |coord| @board[coord.first][coord.last]}.join("")
    end
end
# Initial solution has well-defined variables and is D.R.Y.

# DRIVER TESTS GO BELOW THIS LINE
boggle_board = Boggle.new([["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]])
  puts boggle_board.create_word([2,1], [1,1], [1,2], [0,3])  == "code"
  puts boggle_board.create_word([0,1], [0,2], [1,2])  == "rad"

# Reflection 

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
# CLASS Boggle
# DEFINE initialize with one argument called board
#   @board = board
# END
# DEFINE a method get_row with a single argument, row
#   RETURN everything at row number as an array
# END

# Initial Solution
class Boggle
    def initialize(board)
        @board = board
    end

    def get_row(row)
        return @board[row]
    end
end



# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE
puts boggle_board.get_row(1) ==  ["i", "o", "d", "t"]
puts boggle_board.get_row(1).class == Array

# Reflection 



#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode
# Input: column number
# Output: all of the characters in that column as an array

# STEPS:
    # Open class Boggle
    # DEFINE method called get_col which takes argument col
        # DEFINE column as a new array
        # iterate over each element in @board
            # for each element, add the col element to the column array
        # END iteration
        # Join elements in column array
        # RETURN joined elements of column array
    # END method, close class Boggle
    
    # 

# Initial Solution
class Boggle
    def get_col(col)
        @column = Array.new
        @board.each {|row| @column << row[col]}
        return @column
    end
end



# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE
puts boggle_board.get_col(1) == ["r", "o", "c", "a"]
puts boggle_board.get_col(3) == ["e", "t", "r", "e"]

# Reflection 