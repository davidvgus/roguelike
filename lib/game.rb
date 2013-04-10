# lib/game.rb

class Game

  attr_accessor :player, :running
  attr_reader :map

  def initialize map
    @map = map
    @running = false
  end

  def add_player player
    player.respond_to?(:move) ? @player =
      player : (raise TypeError, "Player must be Mob class")
  end

  def process_input input
    case input
    when "q"
      @running = false
    end
  end

  def start
    @running = true
  end

  def stop
    @running = false
  end

end
