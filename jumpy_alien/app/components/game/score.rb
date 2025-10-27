class Game
  class Score
    attr_reader :score

    def initialize
      @score = 0
    end

    def increment = @score += 1
  end
end
