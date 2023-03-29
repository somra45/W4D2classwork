module Stepable

    def moves
       pos = self.position 
       x , y = pos
       possible_moves = []
       self.move_diffs.each do |move|
            possible_moves << [(x + move[0]) , (y + move[1])]
       end
       possible_moves.select! {|move| board.is_valid?(move)}
       possible_moves.select! do |move|
        board[move] == NullPiece || board[move].color != self.color 
       end
       possible_moves  
    end

    def move_diffs
        raise "Not implemented in subclass"
    end

end