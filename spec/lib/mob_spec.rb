# spec/lib/mob_spec.rb

require "spec_helper"
require "mob"
require "game"

describe Mob do

  let(:mob) { Mob.new(3,4,"@", Game.new) }

  context "#initialize" do

    it "sets x and y coordinates" do
      mob.get_coords.should eq [3,4]
    end

    it "sets correct character representation" do
      mob.character.should eq "@"
    end

    it "sets nil for both coords on new mob" do
      mob.get_prev_coords.should eq [nil,nil]
    end
  end

  context "#set_prev" do

    let(:mob2) { Mob.new(8,9,"I", Game.new) }

    it "sets previous coordinates" do
      mob2.set_prev_coords [1,1]
      mob2.get_prev_coords.should eq [1,1]
    end

  end

  context "#move" do
    it "moves left" do
      mob.move(:left)
      mob.get_coords.should be [0,0]
    end
  end
#   def move(direction)
#     x_direction, y_direction = @move_vector[direction]
#     if passable?(x,y)
#      set_prev
#      @x += x_direction
#      @y += y_direction
#     end
#   end

end

