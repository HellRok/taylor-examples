require "app/components/fade_out"

require "app/components/game/alien"
require "app/components/game/background"
require "app/components/game/end_screen"
require "app/components/game/ground"
require "app/components/game/pipes"
require "app/components/game/score"

class Game
  attr_reader :score, :alien, :background, :ground, :pipes, :end_screen

  def initialize
    @state = :playing
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
    @alien.update(delta)

    if @state == :playing
      @background.update(delta)
      @ground.update(delta)
      @pipes.update(delta)
    end

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
    @state = :game_over
    @alien.kill
    @end_screen = Game::EndScreen.new(
      score: @score.score
    )
  end
end
