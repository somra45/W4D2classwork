require_relative "piece.rb"
require_relative "slideable.rb"

class Queen < Piece
 
    include Slideable

    def symbol
        if self.color == :white
            ♕
        else
            ♛
        end
    end

    private

    def move_dirs
        HORIZONTAL_DIRS + DIAGONAL_DIRS
    end
    
end