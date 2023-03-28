require_relative "piece"
class Board
    def initialize
        @rows = Array.new(8) {Array.new(8,nil)}
        i = 0
        while i < @rows.length
            j = 0
            while j < @rows.length 
                if i == 0 || i == 1 || i == 6 || i == 7
                    @rows[i][j] = Piece.new
                end
                j += 1
            end
            i += 1
        end
    end

    def [](pos)
        x,y = pos
        @rows[x][y]
    end

    def []=(pos,val)
        x,y = pos 
        row, col = val 
        @rows[x][y] = @rows[row][col]
    end

    def move_piece(start_pos,end_pos)
        # x,y = end_pos
        if !self[start_pos].nil? 
            self[start_pos] = self[end_pos]
        else 
            raise "nil piece at posisition"
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
