require "app/components/game/alien"
require "app/components/game/background"
require "app/components/game/end_screen"
require "app/components/game/ground"
require "app/components/game/pipes"
require "app/components/game/score"

class Game
  attr_reader :score, :alien, :background, :ground, :pipes

  def initialize
    @score = Game::Score.new
    @alien = Game::Alien.new
    @background = Game::Background.new
    @ground = Game::Ground.new
    @pipes = Game::Pipes.new(
      alien: @alien,
      on_collision: method(:player_died),
      on_jumped_through: method(:jump_through_pipe)
    )
  end

  def update(delta)
    @background.update(delta)
    @ground.update(delta)

    @pipes.update(delta)
    @alien.update(delta)

    @end_screen&.update(delta)
  end

  def draw
    @background.draw
    @pipes.draw
    @ground.draw
    @alien.draw
    @score.draw

    @end_screen&.draw
  end

  def jump_through_pipe = @score.increment

  def player_died
    @alien.kill
    @end_screen = Game::EndScreen.new
  end
end
