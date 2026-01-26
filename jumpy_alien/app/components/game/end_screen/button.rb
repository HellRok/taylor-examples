require "app/components/shared/button"

class Game
  class EndScreen
    class Button
      include ::Button

      attr_reader :test_id, :text, :position, :callback

      def initialize(test_id:, text:, position:, &block)
        @test_id = test_id
        @text = text

        @position = position
        @position.thickness = 3

        @callback = block
        @font_size = 48
      end
    end
  end
end
