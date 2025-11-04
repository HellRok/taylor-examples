class Game
  class Score
    attr_reader :score

    def initialize
      @score = 0
      @font_size = 60
      @rectangle = Rectangle.new(
        x: 120, y: 10,
        width: 120, height: 60,
        colour: Colour::LIGHTGRAY,
        thickness: 3, outline: Colour::GRAY
      )
    end

    def increment
      @score += 1
      @text_position = nil
    end

    def font = Resources.font("./assets/kenney_pixel.ttf", size: @font_size)

    def text = @score.to_s

    def text_position
      return @text_position if @text_position

      @text_size = font.measure(text)

      @text_position = Vector2[
        @rectangle.x + ((@rectangle.width - @text_size.width) / 2),
        @rectangle.y + ((@rectangle.height - @text_size.height) / 2)
      ]
    end

    def draw
      @rectangle.draw
      font.draw(text, position: text_position)

      if Scene::DEBUG
        Rectangle.new(
          x: text_position.x, y: text_position.y,
          width: @text_size.x, height: @text_size.y,
          colour: Colour::BLANK,
          outline: Colour::GREEN
        ).draw
      end
    end
  end
end
