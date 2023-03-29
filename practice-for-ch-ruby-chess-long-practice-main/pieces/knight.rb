class Knight

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