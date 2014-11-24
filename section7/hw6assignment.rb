# Coursera - Programming Languages (University of Washington), Homework 6
#   completed by Walter B. Vaughan

# Notes for the reader:
# Methods which are mostly just copy-pasted have an '#overridden' next to them.
# I tried to put comments next to code with their relevance to each enhancement
# like "ENHANCEMENT 2",

class MyPiece < Piece
    # include new pieces, ENHANCEMENT 2
    All_My_Pieces = All_Pieces +
                     # P shape
                    [rotations([[0, 0], [-1, 0], [1, 0], [0, -1], [-1, -1]]),
                     # 5-long (only needs two)
                     [[[0, 0], [-1, 0], [-2, 0], [1, 0], [2, 0]],
                     [[0, 0], [0, -1], [0, -2], [0, 1], [0, 2]]],
                     # 3-corner
                     rotations([[0, 0], [1, 0], [0, 1]])]

    def self.next_piece (board) #overridden
        MyPiece.new(All_My_Pieces.sample, board)
    end
end

class MyBoard < Board

    def initialize (game) #overridden
        @grid = Array.new(num_rows) {Array.new(num_columns)}
        @current_block = MyPiece.next_piece(self)
        @score = 0
        @game = game
        @delay = 500
    end
    def next_piece #overridden
        @current_block = MyPiece.next_piece(self)
        @current_pos = nil
    end

    # supplied version of this method assumes
    # each piece has 4 blocks, which we fucked up with ENHANCEMENT 2
    def store_current #overridden
        locations = @current_block.current_rotation
        displacement = @current_block.position
        (0..(locations.size-1)).each{|index| # replaced 3 with locations.size-1
            current = locations[index];
            @grid[current[1]+displacement[1]][current[0]+displacement[0]] =
            @current_pos[index]
        }
        remove_filled
        @delay = [@delay - 2, 80].max
    end

    # rotates a piece 180 degrees, ENHANCEMENT 1
    def rotate_180
        if !game_over? and @game.is_running?
            @current_block.move(0, 0, 2)
        end
        draw
    end
end

class MyTetris < Tetris
    def key_bindings #overridden
        # binding for 180 degree spin, ENHANCEMENT 1
        @root.bind('u', proc {@board.rotate_180})
        # pre-existing binds
        @root.bind('n', proc {self.new_game})
        @root.bind('p', proc {self.pause})
        @root.bind('q', proc {exitProgram})
        @root.bind('a', proc {@board.move_left})
        @root.bind('Left', proc {@board.move_left})
        @root.bind('d', proc {@board.move_right})
        @root.bind('Right', proc {@board.move_right})
        @root.bind('s', proc {@board.rotate_clockwise})
        @root.bind('Down', proc {@board.rotate_clockwise})
        @root.bind('w', proc {@board.rotate_counter_clockwise})
        @root.bind('Up', proc {@board.rotate_counter_clockwise})
        @root.bind('space' , proc {@board.drop_all_the_way})
    end

    # to use sub-classed 'enhanced' versions
    def set_board #overridden
        @canvas = TetrisCanvas.new
        @board = MyBoard.new(self)
        @canvas.place(@board.block_size * @board.num_rows + 3,
                      @board.block_size * @board.num_columns + 6, 24, 80)
        @board.draw
    end
end
