require_relative "pieces.rb"
require "byebug"

class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(8) {Array.new(8,NullPiece.instance)}
        i = 0
        while i < @grid.length
            j = 0
            while j < @grid.length 
                if i == 1 
                    @grid[i][j] = Pawn.new(:white, grid, [i,j])
                elsif i == 6 
                    @grid[i][j] = Pawn.new(:black, grid, [i,j])
                end
                j += 1
            end
            i += 1
        end
        @grid[0][0] = Rook.new(:white, grid, [0,0])
        @grid[0][1] = Knight.new(:white, grid, [0,1])
        @grid[0][2] = Bishop.new(:white, grid, [0,2])
        @grid[0][3] = Queen.new(:white, grid, [0,3])
        @grid[0][4] = King.new(:white, grid, [0,4])
        @grid[0][5] = Bishop.new(:white, grid, [0,5])
        @grid[0][6] = Knight.new(:white, grid, [0,6])
        @grid[0][7] = Rook.new(:white, grid, [0,7])

        @grid[7][0] = Rook.new(:black, grid, [7,0])
        @grid[7][1] = Knight.new(:black, grid, [7,1])
        @grid[7][2] = Bishop.new(:black, grid, [7,2])
        @grid[7][3] = Queen.new(:black, grid, [7,3])
        @grid[7][4] = King.new(:black, grid, [7,4])
        @grid[7][5] = Bishop.new(:black, grid, [7,5])
        @grid[7][6] = Knight.new(:black, grid, [7,6])
        @grid[7][7] = Rook.new(:black, grid, [7,7])
    end

    def [](pos)
        x,y = pos
        @grid[x][y]
    end

    def []=(pos,val)
        x,y = pos 
        @grid[x][y] = val
    end

    def move_piece(color, start_pos,end_pos)
        x,y = end_pos
        if !self[start_pos].is_a?(NullPiece) && is_valid?(end_pos)
            @grid[x][y] = self[start_pos]
            self[start_pos] = NullPiece.instance
        else 
            raise "nil piece at position"
        end
    end

    def is_valid?(pos)
        x,y = pos 
        if x < 0 && x > 7 && y < 0 && y > 7
            return false
        end
        true
    end
end
