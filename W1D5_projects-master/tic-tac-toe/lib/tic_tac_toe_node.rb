require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return false if board.winner == evaluator && board.winner.nil? && board.over?
    return true if board.winner == alt_mark(evaluator) && board.over?
    children.all? { |child| child.losing_node?(evaluator) }
  end

  def winning_node?(evaluator)
    return true if board.winner == evaluator && board.over?
    return false if board.winner == alt_mark(evaluator) && board.winner.nil? && board.over?
    children.any? { |child| child.winning_node?(evaluator) } 
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    valid_moves = []
    @board.rows.each do |row|
      row.each { |pos| valid_moves << pos if pos.nil? }
    end

    valid_moves.map { |move| TicTacToeNode.new(@board.dup, alt_mark(@next_mover_mark), move) }
  end

  def alt_mark(mark)
    mark == :x ? :o : :x
  end
end
