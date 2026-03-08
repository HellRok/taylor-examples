require "app/components/fade_out"
require "app/components/main_menu/button"
require "app/components/settings_menu/volume_widget"

class SettingsMenu
  def test_id = :settings_menu

  def initialize
    @master_volume_widget = SettingsMenu::VolumeWidget.new(
      label: "Master volume",
      offset: 20,
      volume: -> { Scene.audio_manager.master_volume },
      up: -> { volume_up(:master) },
      down: -> { volume_down(:master) }
    )

    @music_volume_widget = SettingsMenu::VolumeWidget.new(
      label: "Music volume",
      offset: 140,
      volume: -> { Scene.audio_manager.music_volume },
      up: -> { volume_up(:music) },
      down: -> { volume_down(:music) }
    )

    @sound_volume_widget = SettingsMenu::VolumeWidget.new(
      label: "Effects volume",
      offset: 260,
      volume: -> { Scene.audio_manager.sound_volume },
      up: -> { volume_up(:sound) },
      down: -> { volume_down(:sound) }
    )

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
    @master_volume_widget.update
    @music_volume_widget.update
    @sound_volume_widget.update
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

    @master_volume_widget.draw
    @music_volume_widget.draw
    @sound_volume_widget.draw
    @back_button.draw

    @transition&.draw
  end

  private

  def volume_up(setting)
    volume_change(setting, 0.1)
  end

  def volume_down(setting)
    volume_change(setting, -0.1)
  end

  def volume_change(setting, adjustment)
    Scene.audio_manager.set_volume(
      setting,
      (Scene.audio_manager.volume_for(setting) + adjustment).clamp(0, 1)
    )
  end
end
