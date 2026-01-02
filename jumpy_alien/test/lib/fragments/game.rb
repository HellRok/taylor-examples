module Fragments
  class Game
    def self.game
      raise "Incorrect scene" unless Scene.current.is_a?(::Game)
      Scene.current
    end

    def self.score = game.score.score

    def self.jump_through_pipe = game.jump_through_pipe

    def self.hit_obstacle = game.player_died

    def self.ended? = !game.instance_variable_get(:@end_screen).nil?
  end
end
