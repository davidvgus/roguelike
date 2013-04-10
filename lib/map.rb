#lib/map.rb
#

class Map

  attr_reader :grid, :height, :width

  def initialize(width, height)
    @height = height
    @width = width
    @grid = Array.new(height) {Array.new(width) {nil}}
  end

  def dimensions
    [@grid.count, @grid[0].count]
  end

  def in_bounds?(x,y)
    can_pass = case
               when x < 0 || x > @width - 1
                 false
               when y < 0 || y > @height - 1
                 false
               else
                 true
               end
  end # in_bounds?

  def load new_grid
    if new_grid.length == @grid.length && new_grid[0].length == @grid[0].length
      @grid = new_grid
      true
    else
      false
    end
  end # load

  def passable?(x,y)
    in_bounds?(x,y) && @grid[y][x] < 1
  end # passable?

end
