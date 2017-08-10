require 'byebug'

class PolyTreeNode

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(parent)
    @parent.children.delete(self) unless @parent.nil?
    parent.children << self unless parent.nil? || parent.children.include?(self)
    @parent = parent
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    unless @children.include?(child_node)
      raise "Is not a child you irresponsible parent!"
    end
    @children.delete(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if @value == target_value
    @children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      queue += node.children
    end
    nil
  end
end
