module Fragments
  class Game
    def self.game
      raise "Incorrect scene" unless Scene.current.is_a?(::Game)
      Scene.current
    end

    def self.score = game.score.score

    def self.jump_through_pipe = game.jump_through_pipe
  end
end
