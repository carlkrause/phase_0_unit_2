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
end
 
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)

puts boggle_board.create_word([1,2], [1,1], [2,1], [3,2]) == "dock"
puts boggle_board.get_row(2) == ["e", "c", "l", "r"]
puts boggle_board.get_col(2) == ["a", "d", "l", "k"]
puts boggle_board.create_word([2,1], [1,1], [1,2], [0,3])  == "code"
puts boggle_board.create_word([0,1], [0,2], [1,2])  == "rad"
puts boggle_board.get_row(1) ==  ["i", "o", "d", "t"]
puts boggle_board.get_row(1).class == Array
puts boggle_board.get_col(1) == ["r", "o", "c", "a"]
puts boggle_board.get_col(3) == ["e", "t", "r", "e"]
for i in (0..3)
    puts boggle_board.get_row(i).join
    puts boggle_board.get_col(i).join
end
puts boggle_board.board[3][2]