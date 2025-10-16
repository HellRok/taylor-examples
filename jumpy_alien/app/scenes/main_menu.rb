require "app/components/fade_out"
require "app/components/main_menu/button"

class MainMenu
  def test_id = :main_menu

  def initialize
    @play_button = MainMenu::Button.new(
      test_id: :play_button,
      text: "Play"
    ) { play! }

    @settings_button = MainMenu::Button.new(
      test_id: :settings_button,
      text: "Settings"
    ) {}

    @quit_button = MainMenu::Button.new(
      test_id: :quit_button,
      text: "Quit"
    ) {}
  end

  def play!
    @transition = FadeOut.new { Scene.current = Game.new }
  end

  def update(delta)
    @transition.update(delta)
  end

  def draw
  end
end
