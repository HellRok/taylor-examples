module Mocks
  class Mouse
    LEFT = 1

    def self.position = @position

    def self.position=(mock)
      @position = mock
    end

    def self.pressed?(_) = @pressed

    def self.pressed=(mock)
      @pressed = mock
    end
  end
end

Mouse = Mocks::Mouse
