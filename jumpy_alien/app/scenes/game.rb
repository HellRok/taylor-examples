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
    @pipes = Game::Pipes.new { jump_through_pipe }
  end

  def update(delta)
    @background.update(delta)
  end

  def draw
    Window.clear colour: Colour::BLUE
    @background.draw
  end

  def jump_through_pipe = @score.increment
end
