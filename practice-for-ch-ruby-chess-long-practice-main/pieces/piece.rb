class Piece 
    attr_reader :color, :moves
    attr_accessor : position


    def initialize(color,board,position)
        @color = color
        @board = board.grid
        @position = position
        @moves = []
    end
end