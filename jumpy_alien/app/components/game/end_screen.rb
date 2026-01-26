require "app/components/game/end_screen/button"

class Game
  class EndScreen
    attr_reader :score, :transition

    def initialize(score: 0)
      @score = score
      @font_size = 100
      @rectangle = Rectangle.new(
        x: 30, y: 120,
        width: 300, height: 280,
        colour: Colour::LIGHTGRAY,
        thickness: 4, outline: Colour::GRAY
      )

      @retry_button = Game::EndScreen::Button.new(
        test_id: :retry_button,
        text: "Retry",
        position: Rectangle.new(
          x: 30, y: 420,
          width: 300, height: 70,
          thickness: 4
        )
      ) { retry! }

      @quit_button = Game::EndScreen::Button.new(
        test_id: :quit_button,
        text: "Quit",
        position: Rectangle.new(
          x: 30, y: 510,
          width: 300, height: 70,
          thickness: 4
        )
      ) { Scene.close }
    end

    def font = Resources.font("./assets/kenney_pixel.ttf", size: @font_size)

    def text_position(text)
      @text_size = font.measure(text)

      Vector2[
        @rectangle.x + ((@rectangle.width - @text_size.width) / 2),
        @rectangle.y + ((@rectangle.height - @text_size.height) / 2)
      ]
    end

    def update(delta)
      @retry_button.update
      @quit_button.update
      @transition&.update(delta)
    end

    def draw
      @rectangle.draw
      @retry_button.draw
      @quit_button.draw

      score_position = text_position("Score")
      score_position.y -= 100
      font.draw(
        "Score",
        position: score_position
      )

      font.draw(
        score.to_s,
        position: text_position(score.to_s)
      )

      @transition&.draw
    end

    def retry!
      @transition = FadeOut.new { Scene.current = Game.new }
    end
  end
end
