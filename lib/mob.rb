# lib/mob.rb

class Mob

  attr_accessor :x, :y, :prev_x, :prev_y
  attr_reader :character

  MOVEMENT_VECTORS = {:up => {x:0, y:-1},
                    :down => {x:0, y:1},
                    :left => {x:-1, y:0},
                    :right => {x:1, y:0}}


  def initialize x, y, character, game
    @x, @y = x, y
    @character = character
    @game = game
  end

  def get_coords
    [@x, @y]
  end

  def get_prev_coords
    [@prev_x, @prev_y]
  end

  def set_prev_coords coords
    @prev_x, @prev_y = coords
  end

  def move(direction)
    new_x, new_y = @x + MOVEMENT_VECTORS[direction][:x],
      @y + MOVEMENT_VECTORS[direction][:y]
    if @game.map.in_bounds?(new_x,new_y) && @game.map.passable?(new_x, new_y)
      @x,@y = @x + MOVEMENT_VECTORS[direction][:x],
        @y + MOVEMENT_VECTORS[direction][:y]
      true
    else
      false
    end
  end
end
