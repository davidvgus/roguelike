#spec/lib/game_spec.rb

require "spec_helper"
require "game"

describe Game do

  context "#initialize" do

    let(:square_map_side) { 10 } 
    let(:map) { Map.new(square_map_side, square_map_side)  }
    let(:game) { Game.new(map) }


    it "should have a map as defined by interface" do
      game.map.should respond_to(:in_bounds?, :passable? )
    end

  end # #initialize

# context "control flow" do
#  pending 
# end
#
# context "Game Constants" do
#   pending
# end #Game constants

# context "#initialize" do
#   pending
# end

# context "#draw_world" do
#   pending
# end

# context "#get_input" do
#   pending
# end

# context "#update_world" do
#   pending
# end

end
