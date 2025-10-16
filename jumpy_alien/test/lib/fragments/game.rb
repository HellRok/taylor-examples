module Fragments
  class Game
    def self.game
      raise "Incorrect scene" unless Scene.current.is_a?(::Game)
      Scene.current
    end

    def self.score = 0
  end
end
