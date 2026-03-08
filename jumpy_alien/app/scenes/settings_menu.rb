require "app/components/fade_out"
require "app/components/main_menu/button"

class SettingsMenu
  def test_id = :settings_menu

  def initialize
    @back_button = MainMenu::Button.new(
      test_id: :back_button,
      text: "Back",
      position: Rectangle[20, 510, 320, 70]
    ) { menu! }
  end

  def menu!
    @transition = FadeOut.new {
      Cursor.icon = Cursor::DEFAULT
      Scene.current = MainMenu.new
    }
  end

  def any_button_hover?
    [
      @back_button
    ].any? { |button| button.hover? }
  end

  def update(delta)
    @back_button.update

    Cursor.icon = if any_button_hover?
      Cursor::POINTING_HAND
    else
      Cursor::DEFAULT
    end

    @transition&.update(delta)
  end

  def draw
    Window.clear colour: Colour::RAYWHITE
    @back_button.draw

    @transition&.draw
  end
end
