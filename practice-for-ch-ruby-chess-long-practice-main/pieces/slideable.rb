module Slideable

    HORIZONTAL_DIRS = [
        [0, -1], 
        [0, 1], 
        [1, 0], 
        [-1, 0]
    ].freeze

    DIAGONAL_DIRS = [
        [1, -1],
        [1, 1],
        [-1, -1]
        [-1, 1]
    ].freeze

    attr_reader :DIAGONAL_DIRS , :HORIZONTAL_DIRS

    def moves
        self.position = start
        moves = []
        self.move_dirs.each do |dir|
            moves += grow_unblocked_moves_in_dir(start, dir)
        end
        moves
    end

    private

    def move_dirs
        raise "Implement in Subclass"
    end

    def grow_unblocked_moves_in_dir(pos, dir)
        possible_moves = []
        x, y = pos
        a, b = dir
        
        while board.is_valid?([x, y]) && board[x, y] == NullPiece.instance
            possible_moves << [(x + a), (y + b)]
            x += a
            y += b
        end

        if board[(x + a), (y + b)].color != self.color
            possible_moves << board[(x + a), (y + b)]
        end

        possible_moves
    end
end