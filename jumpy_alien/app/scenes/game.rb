require "app/components/game/score"
require "app/components/game/alien"
require "app/components/game/background"
require "app/components/game/ground"
require "app/components/game/pipes"

class Game
  attr_reader :score, :alien, :background, :ground, :pipes

  def initialize
    @score = Game::Score.new
    @alien = Game::Alien.new
    @background = Game::Background.new
    @ground = Game::Ground.new
    @pipes = Game::Pipes.new(on_spawn: method(:jump_through_pipe))
  end

  def update(delta)
    @background.update(delta)
    @ground.update(delta)

    @pipes.update(delta)
    @alien.update(delta)
  end

  def draw
    @background.draw
    @pipes.draw
    @ground.draw
    @alien.draw
    @score.draw
  end

  def jump_through_pipe = @score.increment
end
