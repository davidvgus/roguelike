#spec/lib/game_spec.rb

require "spec_helper"
require "game"

describe Game do

  context "Game Constants" do

    it "has a movement vector hash constant" do
      movement_vectors_for_test = {:up => [0, -1],
                    :down => [0, 1],
                    :left => [-1, 0],
                    :right => [1, 0]}

      movement_vectors = Game::MOVEMENT_VECTORS
      movement_vectors.should eq movement_vectors_for_test
    end

  end #Game constants

  context "#initialize" do
    pending
  end

  context "#draw_world" do
    pending
  end

  context "#get_input" do
    pending
  end

  context "#update_world" do
    pending
  end

end
