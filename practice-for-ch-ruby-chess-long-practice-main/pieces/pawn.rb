class Pawn < Piece

    def initialize(color,board,position)
        super
        @start_pos = position
    end
    private 

    def at_start_row?
        if self.position[0] == 1 || self.position[0] == 6
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
        if self.foward_dir == 1
            return self.positon[0] += 1
        else
            return self.position[0] += -1 
        end
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