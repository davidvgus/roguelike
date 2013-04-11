#spec/lib/game_spec.rb

require "spec_helper"
require "game"

describe Game do
    let(:square_map_side) { 10 }
    let(:grid) {  Array.new(square_map_side) {Array.new(square_map_side) {0}} }
    let(:map) { Map.new(square_map_side, square_map_side)  }
    let(:game) { Game.new(map) }
    let(:player) { Mob.new(3,4,"@", game)}


  context "#initialize" do

    it "should have a map as defined by interface" do
      game.map.should respond_to(:in_bounds?, :passable? )
    end

  end # #initialize

  context "#add_player" do

    it "responds with true when palyer added" do
      game.add_player(player)
    end

    it "sets game time to 0" do
      game.game_time.should eq 0
    end
  end

  context "#process input" do

    context "testing movement keys" do

      before(:each) do
        game.map.load(grid)
        game.add_player(player)
      end

      it "moves player up" do
        expect {
          game.process_input("k") 
        }.to change(player, :get_coords).from([3,4]).to([3,3])
      end

      it "moves player down" do
        expect {
          game.process_input("j") 
        }.to change(player, :get_coords).from([3,4]).to([3,5])
      end

      it "moves player right" do
        expect {
          game.process_input("l") 
        }.to change(player, :get_coords).from([3,4]).to([4,4])
      end

      it "moves player left" do
        expect {
          game.process_input("h") 
        }.to change(player, :get_coords).from([3,4]).to([2,4])
      end

    end # testing movement keys

    it "stops game when q is sent" do
      game.start
      expect { 
        game.process_input("q") 
      }.to change(game, :running).from(true).to(false)
    end


  end

  context "#start and #stop" do

    it "sets running to true" do
      expect { game.start }.to change(game, :running).from(false).to(true)
    end

    it "sets running to false" do
      game.start
      expect { game.stop }.to change(game, :running).from(true).to(false)
    end

  end

  context "#update_world" do

    it "returns true" do
      game.update_world.should eq true
    end

    it "increments gametime by one" do
      expect { game.update_world }.to change(game, :game_time).from(0).to(1)
    end

  end

end
