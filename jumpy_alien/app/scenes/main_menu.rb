require "app/components/fade_out"
require "app/components/main_menu/button"

class MainMenu
  def test_id = :main_menu

  def initialize
    @play_button = MainMenu::Button.new(
      test_id: :play_button,
      text: "Play",
      position: Rectangle[20, 350, 320, 70]
    ) { play! }

    @settings_button = MainMenu::Button.new(
      test_id: :settings_button,
      text: "Settings",
      position: Rectangle[20, 430, 320, 70]
    ) { settings! }

    @quit_button = MainMenu::Button.new(
      test_id: :quit_button,
      text: "Quit",
      position: Rectangle[20, 510, 320, 70]
    ) { Scene.close }
  end

  def any_button_hover?
    [
      @play_button,
      @settings_button,
      @quit_button
    ].any? { |button| button.hover? }
  end

  def play!
    @transition = FadeOut.new {
      Cursor.icon = Cursor::DEFAULT
      Scene.current = Game.new
    }
  end

  def settings!
    @transition = FadeOut.new {
      Cursor.icon = Cursor::DEFAULT
      Scene.current = SettingsMenu.new
    }
  end

  def font = Resources.font("./assets/kenney_pixel.ttf", size: 96)

  def position(text)
    size = font.measure(text)

    Vector2[
      ((360 - size.width) / 2),
      ((350 - size.height) / 2)
    ]
  end

  def update(delta)
    @play_button.update
    @settings_button.update
    @quit_button.update

    Cursor.icon = if any_button_hover?
      Cursor::POINTING_HAND
    else
      Cursor::DEFAULT
    end

    @transition&.update(delta)
  end

  def draw
    Window.clear colour: Colour::RAYWHITE

    font.draw(
      "Jumpy\nAlien",
      position: position("Jumpy\nAlien")
    )

    @play_button.draw
    @settings_button.draw
    @quit_button.draw

    @transition&.draw
  end
end
