class King < Piece

    def symbol
        if self.color == :white
            return ♔
        else
            ♚
        end
    end

    protected

    def move_diffs
        [
        [1, 1], 
        [1, -1], 
        [0, 1], 
        [0, -1], 
        [1, 0], 
        [-1, 0], 
        [-1, 1], 
        [-1, -1]
        ]
    end

end
