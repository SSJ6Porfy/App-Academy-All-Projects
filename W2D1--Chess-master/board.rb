require_relative 'pieces'
require_relative 'errors'
require_relative 'display'
require_relative 'game'


class Board
  attr_reader :grid

  KNIGHT_START = [[0,1], [0,6], [7,1], [7,6]]
  ROOK_START = [[0,0],[0,7],[7,0],[7,7]]
  BISHOP_START = [[0,2],[0,5],[7,2],[7,5]]
  KING_START = [[0,4],[7,4]]
  QUEEN_START = [[0,3],[7,3]]
  NULL = NullPiece.new

  def self.setup_board
    grid = Array.new(8) { Array.new(8) }
    grid.each.with_index do |row, x|
      color = x < 2 ? :white : :black
      row.map!.with_index do |spot, y|
        if x == 1 || x == 6
          Pawn.new(self, [x, y], color)
        elsif x.between?(2, 5)
          NULL
        else
          Board.choose_piece([x, y], color)
        end
      end
    end
  end

  def self.choose_piece(pos, color)
    if KNIGHT_START.include?(pos)
      Knight.new(self, pos, color)
    elsif ROOK_START.include?(pos)
      Rook.new(self, pos, color)
    elsif BISHOP_START.include?(pos)
      Bishop.new(self, pos, color)
    elsif KING_START.include?(pos)
      King.new(self, pos, color)
    elsif QUEEN_START.include?(pos)
      Queen.new(self, pos, color)
    end
  end


  def initialize
    @grid = Board.setup_board
  end

  def move_piece(start_pos, end_pos)
    valid_moves = self[end_pos].moves
    begin
      raise NoPieceError if self[start_pos].nil?
      raise InvalidMoveError unless valid_moves.include?(end_pos)
    rescue NoPieceError
      puts 'No Piece selected'
    rescue InvalidMoveError
      puts "Piece can't move there!"
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new

  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def in_bounds?(new_pos)
    x, y = new_pos
    x.between?(0,7) && y.between?(0,7)
  end

  def render
    cursor = Cursor.new(self)
    d = Display.new(self, cursor)
    d.display_board
  end

end
