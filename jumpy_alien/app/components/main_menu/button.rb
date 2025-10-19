class MainMenu
  class Button
    attr_reader :test_id, :text, :position, :callback

    def initialize(test_id:, text:, position:, &block)
      @test_id = test_id
      @text = text

      @position = position
      @position.thickness = 3

      @callback = block
      @font_size = 48
    end

    def font = Resources.font("./assets/kenney_pixel.ttf", size: @font_size)

    def text_position
      return @text_position if @text_position

      size = font.measure(text)

      @text_position = Vector2[
        @position.x + ((@position.width - size.width) / 2),
        @position.y + ((@position.height - size.height) / 2)
      ]
    end

    def hover?
      Mouse.position.x.between?(@position.x, @position.x + @position.width) &&
        Mouse.position.y.between?(@position.y, @position.y + @position.height)
    end

    def clicked?
      hover? && Mouse.pressed?(Mouse::LEFT)
    end

    def click
      return if @callback_called

      @callback_called = true
      @callback.call
    end

    def update
      if hover?
        @position.colour = Colour::GRAY
        @position.outline = Colour::BLACK
      else
        @position.colour = Colour::LIGHTGRAY
        @position.outline = Colour::GRAY
      end

      click if clicked?
    end

    def draw
      @position.draw
      font.draw(
        text,
        position: text_position
      )
    end
  end
end
