# Coursera - Programming Languages (University of Washington), Homework 6

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
    # change this to include new pieces
    All_My_Pieces = All_Pieces 

    def self.next_piece (board)
        MyPiece.new(All_My_Pieces.sample, board)
    end
end

class MyBoard < Board

    def initialize (game)
        @grid = Array.new(num_rows) {Array.new(num_columns)}
        @current_block = MyPiece.next_piece(self)
        @score = 0
        @game = game
        @delay = 500
    end
    def next_piece
        @current_block = MyPiece.next_piece(self)
        @current_pos = nil
    end

    def rotate_180
        if !game_over? and @game.is_running?
            @current_block.move(0, 0, 2)
        end
        draw
    end
end

class MyTetris < Tetris
    def key_bindings
        # binding for 180 degree spin
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
    def set_board
        @canvas = TetrisCanvas.new
        @board = MyBoard.new(self)
        @canvas.place(@board.block_size * @board.num_rows + 3,
                      @board.block_size * @board.num_columns + 6, 24, 80)
        @board.draw
    end
end
