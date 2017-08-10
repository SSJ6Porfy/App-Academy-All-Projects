require_relative 'board'
require_relative 'cursor'
require_relative 'errors'
require_relative 'game'
require 'singleton'

module SlidingPiece

  def moves
    possible_moves = []
    piece.move_dirs.each do |direction|
      x, y = @current_pos
      dx, dy = direction
      new_coord = [x + dx, y + dy]
      until board[new_coord].empty?
        break if board[new_coord].color == @color
        possible_moves << new_coord
        break if board[new_coord].color != @color
        new_coord[0] += dx
        new_coord[1] += dy
      end
    end
    possible_moves
  end

  def horizontal_dirs
    [ [1, 0], [0, 1], [-1, 0], [0, -1] ]
  end

  def diagonal_dirs
    [ [1, 1], [-1, -1], [1, -1], [-1, 1] ]
  end

  # # This is where the piece will step
  # def grow_unblocked_moves_in_dir(dx, dy)
  #
  # end
end

module SteppingPiece

  KNIGHT_MOVES = [
    [-2, -1], [-2,  1], [-1, -2], [-1,  2],
    [ 1, -2], [ 1,  2], [ 2, -1], [ 2,  1]
  ]

  KING_MOVES = [
    [1, 1], [-1, -1], [1, -1], [-1, 1],
    [1, 0], [ 0, 1], [-1, 0], [ 0, -1]
  ]

  def moves
    possible_moves = []
    piece.move_diffs.each do |direction|
      x, y = @current_pos
      dx, dy = direction
      new_coord = [x + dx, y + dy]
      next if board[new_coord].color == @color
      possible_moves << new_coord
    end
    possible_moves
  end
end


class Piece

  attr_reader :symbol, :color

  def initialize(board, current_pos, color)
    @board = board
    @current_pos = current_pos
    @color = color
  end

  def to_s
    @symbol.to_s
  end

  def empty?
    self == NullPiece
  end

end

class NullPiece < Piece
  # include Singleton

  def initialize
    @symbol = nil
  end

end

class Queen < Piece
  include SlidingPiece

  def initialize(board, current_pos, color)
    super
    @symbol = :Q
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end


end

class Rook < Piece

  include SlidingPiece

  def initialize(board, current_pos, color)
    super
    @symbol = :R
  end

  def move_dirs
    horizontal_dirs
  end
end


class Bishop < Piece
  include SlidingPiece
  def initialize(board, current_pos, color)
    super
    @symbol = :B
  end

  def move_dirs
    diagonal_dirs
  end
end

class King < Piece
  include SteppingPiece

  def initialize(board, current_pos, color)
    super
    @symbol = :K
  end

  def move_diffs
    KING_MOVES
  end

end

class Knight < Piece
  include SteppingPiece

  def initialize(board, current_pos, color)
    super
    @symbol = :N
  end

  def move_diffs
    KNIGHT_MOVES
  end
end

class Pawn < Piece

  MOVES = [[0, 1],[0, 2],[0, -1],[0, -2]]

  ATTACKS = [[1, 1],[-1, 1],[-1, -1],[1, -1]]

  def initialize(board, current_pos, color)
    super
    @symbol = :P
  end

  def moves
    possible_moves = []
    forward_dirs.each do |direction|
      x, y = @current_pos
      dx, dy = direction
      new_coord = [x + dx, y + dy]
      next if board[new_coord].color == @color
      possible_moves << new_coord
    end
    possible_moves
  end


  def at_start_row?
    @color == :black ? @current_pos[1] == 6 : @current_pos[1] == 1
  end

  def forward_dirs
    forward_steps + side_attacks
  end

  def forward_steps
    if @color == :black && at_start_row?
      MOVES[2..3]
    elsif @color == :black
      MOVES[2]
    elsif @color == :white && at_start_row?
      MOVES[0..1]
    else
      MOVES[0]
    end
  end

  def side_attacks
    @color == :black ? ATTACKS[2..3] : ATTACKS[0..1]
  end

end
