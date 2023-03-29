require_relative "piece.rb"
require_relative "nullPiece.rb"

class Pawn < Piece

    def initialize(color,board,position)
        super
        @start_pos = position
    end

    def symbol
        if self.color == :white
            ♙
        else
            ♟︎
        end
    end

    def moves
        # forward_moves = self.forward_steps.select
        # {|move| board.is_valid?(move) && board[move] == NullPiece.instance}
        
        # side_moves = side_attacks.select
        # {|move| board.is_valid?(move) && board[move] != self.color 
        # && board[move] != NullPiece.instance}
        p self.forward_steps
        # forward_moves + side_moves
        
    end
    private 

    def at_start_row?
        if self.position[0] == @start_pos[0] || self.position[0] == @start_pos[6]
            return true
        end
        return false
    end

    def foward_dir
        if @start_pos[0] == 1 
            return 1
        elsif @start_pos[0] == 6
            return -1
        end
    end

    def forward_steps
        self.position = x,y
        possible_moves = []

        if self.foward_dir == 1
            possible_moves << [x + 1, y]
        else
            possible_moves << [x - 1, y]
        end

        if self.at_start_row? && self.foward_dir == 1
            possible_moves << [x + 2, y]
        elsif self.at_start_row? && self.foward_dir == -1
            possible_moves << [x - 2, y]
        end
        possible_moves
    end
    
    def side_attacks
        newArr = []
        self.position = x, y
        if self.foward_dir == 1
            newArr << [x + 1, y + 1]
            newArr <<  [x + 1, y - 1]
        else
            newArr << [x - 1, y + 1]
            newArr << [x - 1, y - 1]
        end
        newArr
    end
end