require "../skeleton/lib/00_tree_node.rb"

class KnightPathFinder

  attr_reader :start_pos, :visited_pos, :root

  DELTAS = [[-1,-2],[1,-2],[-2,-1],[2,-1],[-2,1],[2,1],[-1,2],[1,2]].freeze

  def self.valid_moves(pos)
    moves = DELTAS.map { |delta| [pos[0] + delta[0], pos[1] + delta[1]] }
    moves.select do |move|
      move[0].between?(0, 7) && move[1].between?(0, 7)
    end
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_pos = [start_pos]
    @root = PolyTreeNode.new(@start_pos)
  end

  def new_move_pos(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    valid_moves.reject! { |move| @visited_pos.include?(move) }
    @visited_pos += valid_moves
    valid_moves
  end

  def build_move_tree
    queue = [@root]
    until queue.empty?
      curr_node = queue.shift
      child_pos = new_move_pos(curr_node.value)
      child_nodes = child_pos.map { |pos| PolyTreeNode.new(pos) }
      queue += child_nodes
      child_nodes.each { |child| curr_node.add_child(child) }
    end
    nil
  end

  def find_path(end_pos)
    queue = [@root]
    until queue.empty?
      node = queue.shift
      end_node = node if node.value == end_pos
      queue += node.children
    end
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    path = [end_node.value]
    curr_node = end_node
    until curr_node.parent == nil
      path << curr_node.parent.value
      curr_node = curr_node.parent
    end
    path.reverse
  end
end
