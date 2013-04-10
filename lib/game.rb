# lib/game.rb


class KeyRouter

end

class Game

  attr_accessor :player, :running
  attr_reader :map, :game_time

  def initialize map
    @map = map
    @running = false
    @game_time = 0
    @key_router = KeyRouter.new
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

  def running?
    @running
  end

  def start
    @running = true
  end

  def stop
    @running = false
  end

  def update_world
    @game_time += 1
    true
  end

end
