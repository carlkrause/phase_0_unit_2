## week 6 assignment
# I worked on this challenge with Catherine Farkas.


# 2. Pseudocode
# CLASS BoggleBoard

    # DEFINE initialize with one argument called board
    #   @board = board
    # END

     # DEFINE method create_word; with one argument--and an argument which has unspecified number of inputs
        # It is iterating over @board and accessing each element at the coordinates
        # Returns character at coordinates, joined into a single string with no spaces between characters
    # END
    
    # DEFINE method called get_col which takes argument col
            # DEFINE column as a new array
            # iterate over each element in @board
                # for each element, add the col element to the column array
            # END iteration
            # RETURN column array
        # END method
    
    # DEFINE a method get_row with a single argument, row
    #   RETURN everything at row number as an array
    # END
    
    # DEFINE a method called diagonal which takes two arrays, p1 and p2
        # DEFINE m as (p1[1]-p2[1]) / (p1[0] - p2[0])
        # CASE m
            # when m is 1
            # when m is -1
            # else
                # throw error message
        # END case
# END class BoggleBoard


# 3. Initial Solution
class BoggleBoard
    attr_reader :board
    def initialize(board)
        @board = board
    end
    
    def create_word(*coords)
        coords.map { |coord| @board[coord[0]][coord[1]]}.join("")
    end
    
    def get_row(row)
        @board[row]
    end
    
    def get_col(col)
        @column = Array.new
        @board.each {|row| @column << row[col]}
        return @column
    end
    
    def get_diagonal(point1,point2)
        m = (point1[1]-point2[1]) / (point1[0]-point2[0])
        case m
        when 1
            until point1[0] == 0
                point1[0] -= 1
                point1[1] -= 1
            end
        when -1
            until point1[0] == 0
                point1[0] -= 1
                point1[1] += 1
            end
        else
            puts "There is no diagonal with these two points"
        end
    end
end
 
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)
 


# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:
puts boggle_board.create_word([1,2], [1,1], [2,1], [3,2]) == "dock"
puts boggle_board.get_row(2) == ["e", "c", "l", "r"]
puts boggle_board.get_col(2) == ["a", "d", "l", "k"]
for i in (0..3)
    puts boggle_board.get_row(i).join
    puts boggle_board.get_col(i).join
end
puts boggle_board.create_word([2,1], [1,1], [1,2], [0,3])  == "code"
puts boggle_board.create_word([0,1], [0,2], [1,2])  == "rad"
puts boggle_board.get_row(1) ==  ["i", "o", "d", "t"]
puts boggle_board.get_row(1).class == Array
puts boggle_board.get_col(1) == ["r", "o", "c", "a"]
puts boggle_board.get_col(3) == ["e", "t", "r", "e"]
puts boggle_board.board[3][2]

# 5. Reflection
# => Catherine and I decided to pair again because we had been a little ahead of ourselves last week.
# => It certainly made solving everything but the bonus quite easy.
# => We took a stab at the diagonal challenge and Catherine definitely knew what to do.
# => I understood the logic--test the slope and then use it to determine diagonals--but I'll need to return to it to flesh it out on my own.