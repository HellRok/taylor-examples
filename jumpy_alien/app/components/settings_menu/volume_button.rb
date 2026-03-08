require "app/components/shared/button"

class SettingsMenu
  class VolumeButton
    include ::Button

    attr_reader :test_id, :text, :position, :callback

    def initialize(test_id:, text:, position:, &block)
      @test_id = test_id
      @text = text

      @position = position
      @position.thickness = 3

      @callback = block
      @font_size = 32
    end

    def update(delta = 0)
      super
      @callback_called = false if Mouse.released?(Mouse::LEFT)
    end
  end
end
