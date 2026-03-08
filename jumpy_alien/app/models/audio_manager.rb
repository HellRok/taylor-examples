class AudioManager
  attr_accessor :master_volume, :music_volume, :sound_volume

  def initialize
    @master_volume = 0.8
    @music_volume = 0.4
    @sound_volume = 1.0

    @master_volume = 0 if Scene::DEBUG

    @background_music = Resources.music("./assets/positive_loop.ogg", volume: adjusted_music_volume)

    @click = Resources.sound("./assets/interface_sounds/click_001.ogg", volume: adjusted_sound_volume)
    @jump = Resources.sound("./assets/interface_sounds/select_002.ogg", volume: adjusted_sound_volume)
    @score = Resources.sound("./assets/interface_sounds/drop_004.ogg", volume: adjusted_sound_volume)
    @death = Resources.sound("./assets/interface_sounds/confirmation_002.ogg", volume: adjusted_sound_volume)
  end

  def update_volumes
    @background_music.volume = adjusted_music_volume

    @click.volume = adjusted_sound_volume
    @jump.volume = adjusted_sound_volume
    @score.volume = adjusted_sound_volume
    @death.volume = adjusted_sound_volume
  end

  def play_background_music
    @background_music.play
  end

  def stop_background_music
    @background_music.stop
  end

  def play(sound)
    sound_for(sound).play
  end

  def update
    @background_music.update
  end

  def volume_for(setting)
    case setting
    when :master
      @master_volume
    when :music
      @music_volume
    when :sound
      @sound_volume
    end
  end

  def set_volume(setting, volume)
    case setting
    when :master
      @master_volume = volume
    when :music
      @music_volume = volume
    when :sound
      @sound_volume = volume
    end

    update_volumes
  end

  private

  def adjusted_sound_volume
    @master_volume * @sound_volume
  end

  def adjusted_music_volume
    @master_volume * @music_volume
  end

  def sound_for(sound)
    case sound
    when :click
      @click
    when :jump
      @jump
    when :score
      @score
    when :death
      @death
    end
  end
end
