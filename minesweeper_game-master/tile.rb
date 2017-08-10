class Tile
  attr_reader :bombed, :flagged, :revealed

  def initialize
    @bombed = false
    @flagged = false
    @revealed = false
    @value = nil
  end

  def reveal
    #tell us information about the tile
  end

  def neighbors
    # reveal the neighbors of a tile.
  end

  def neighbor_bomb_count
    #counts the number of bombs in adjacent tiles
  end
end
