require_relative "piece.rb"
require_relative "stepable.rb"

class Knight
    
    include Stepable
    
    def symbol
        if self.color == :white
            ♘
        else
            ♞
        end
    end

    def move_diffs
        [ 
            [2, 1],
            [2, -1],
            [-2, 1],
            [-2, -1],
            [1, 2],
            [1, -2],
            [-1, 2],
            [-1, -2]
        ]
    end
end