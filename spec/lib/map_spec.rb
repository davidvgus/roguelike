#spec/lib/map.rb

require "spec_helper"
require "map"

describe Map do

  let(:grid_side) { 10 }
  let!(:map)  { Map.new(grid_side ,grid_side) }

  context "initialize" do

    it "map has dimensions" do
      map.dimensions.should eq [10,10]
    end

    it 'initialized map is 10x10 of nils' do
      grid = Array.new(grid_side) {Array.new(grid_side) {nil}}
      map.grid.should eq grid
    end
  end #initialize

  context "#in_bounds?" do

      it "no go off map above" do
        map.in_bounds?(1,-1).should be_false
      end

      it "no go off map bottom" do
        map.in_bounds?(1, grid_side).should be_false
      end

      it "no go off map right" do
        map.in_bounds?(grid_side, 1).should be_false
      end

      it "no go off map left" do
        map.in_bounds?(-1, 1).should be_false
      end

  end #in_bounds?

  context "#passable?" do

    let!(:all_0_grid) { Array.new(grid_side) {Array.new(grid_side) {0}} }
    let!(:all_1_grid) { Array.new(grid_side) {Array.new(grid_side) {1}} }

    it "reports true for passable tile" do
      map.load(all_0_grid)
      map.passable?(1,1).should be_true
    end

    it "returns false for unpassable tile" do
      map.load(all_1_grid)
      map.passable?(1,1).should be_false
    end

  end #passable?

  context "#load" do

    it "loads map from array" do
      new_grid = Array.new(grid_side) {Array.new(grid_side) {0}}
      map.load(new_grid).should be_true
    end #loads map from array

  end #load

  context "#load_file" do
    before(:each) do
    end

    it "loads map from file" do
      map.load_file("map1")
      test_map = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0],
                   [0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0],
                   [0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0],
                   [0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0],
                   [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
      map.grid.should eq test_map
    end

  end

end #end Map class

