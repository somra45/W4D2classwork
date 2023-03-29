require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece
 
    include Slideable

    def symbol
        if self.color == :white
            ♗
        else
            ♝
        end
    end

    private

    def move_dirs
        DIAGONAL_DIRS
    end
    
end