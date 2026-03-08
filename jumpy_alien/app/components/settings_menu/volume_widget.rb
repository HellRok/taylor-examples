require "app/components/settings_menu/volume_button"

class SettingsMenu
  class VolumeWidget
    def initialize(offset: 0, label: "volume", volume: -> { "" }, up: -> {}, down: -> {})
      @offset = offset
      @label = label
      @label_position = Vector2[20, offset]
      @volume = volume
      @down_button = SettingsMenu::VolumeButton.new(
        test_id: :down_button,
        text: "-",
        position: Rectangle[20, offset + 50, 50, 50]
      ) { down.call }
      @up_button = SettingsMenu::VolumeButton.new(
        test_id: :up_button,
        text: "+",
        position: Rectangle[290, offset + 50, 50, 50]
      ) { up.call }
    end

    def font = Resources.font("./assets/kenney_pixel.ttf", size: 48)

    def volume
      "#{(@volume.call * 100).round}%"
    end

    def position(text, offset)
      size = font.measure(text)

      Vector2[
        ((360 - size.width) / 2),
        @offset + offset + ((50 - size.height) / 2)
      ]
    end

    def draw
      font.draw(@label, position: position(@label, 0))
      font.draw(volume, position: position(volume, 50))

      @down_button.draw
      @up_button.draw
    end

    def update
      @down_button.update
      @up_button.update
    end
  end
end
