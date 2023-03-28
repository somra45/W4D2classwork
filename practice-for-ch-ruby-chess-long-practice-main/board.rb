require_relative "piece"
require "byebug"
class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(8) {Array.new(8,nil)}
        i = 0
        while i < @grid.length
            j = 0
            while j < @grid.length 
                if i == 0 || i == 1 
                    @grid[i][j] = Piece.new(:white, grid, [i,j])
                elsif i == 6 || i == 7 
                    @grid[i][j] = Piece.new(:black, grid, [i,j])
                else
                    @grid[i][j] = NullPiece.new
                end
                j += 1
            end
            i += 1
        end
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
        if !self[start_pos].nil? && is_valid?(end_pos)
            @grid[x][y] = self[start_pos]
            self[start_pos] = NullPiece.new
        else 
            raise "nil piece at position"
        end
    end

    def is_valid?(pos)
        x,y = pos 
        if x < 0 && x > 7 && y < 0 && y > 7
            return false
        end
        return true
    end
end
