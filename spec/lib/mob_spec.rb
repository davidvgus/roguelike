# spec/lib/mob_spec.rb

require "spec_helper"
require "mob"
require "map"
require "game"

describe Mob do
  let(:grid_side) { 10 }
  let(:map) { Map.new(10,10) }
  let(:grid) { Array.new(grid_side) {Array.new(grid_side) {0}} }
  let(:game) { Game.new(map) }
  let(:mob) { Mob.new(3,4,"@", game) }


  context "has constants" do

    it "has a movement vector hash constant" do
      movement_vectors_for_test = {:up => {x:0, y:-1},
                    :down => {x:0, y:1},
                    :left => {x:-1, y:0},
                    :right => {x:1, y:0}}

      movement_vectors = Mob::MOVEMENT_VECTORS
      movement_vectors.should eq movement_vectors_for_test
    end
  end

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

    let(:mob2) { Mob.new(8,9,"I", Game.new(map)) }

    it "sets previous coordinates" do
      mob2.set_prev_coords [1,1]
      mob2.get_prev_coords.should eq [1,1]
    end

  end

  context "#move" do

    before(:each) do
      game.map.load(grid)
    end

    it "moves down" do
      game.map.load(grid)
      mob.move(:down)
      mob.get_coords.should eq [3,5]
    end

    it "moves up" do
      game.map.load(grid)
      mob.move(:up)
      mob.get_coords.should eq [3,3]
    end


    it "moves up" do
      game.map.load(grid)
      mob.move(:up)
      mob.get_coords.should eq [3,3]
    end


    it "moves left" do
      game.map.load(grid)
      mob.move(:left)
      mob.get_coords.should eq [2,4]
    end

    it "moves right" do
      game.map.load(grid)
      mob.move(:right)
      mob.get_coords.should eq [4,4]
    end

  end

end

