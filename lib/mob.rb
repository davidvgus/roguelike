# lib/mob.rb

class Mob

  attr_accessor :x, :y, :prev_x, :prev_y
  attr_reader :character

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
  end
end
