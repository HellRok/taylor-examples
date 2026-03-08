class AudioManager
  attr_accessor :master_volume
  attr_writer :music_volume, :sound_volume

  def initialize
    @master_volume = 0.8
    @music_volume = 0.4
    @sound_volume = 1.0

    @background_music = Resources.music("./assets/positive_loop.ogg", volume: music_volume)

    @click = Resources.sound("./assets/interface_sounds/click_001.ogg", volume: sound_volume)
    @jump = Resources.sound("./assets/interface_sounds/select_002.ogg", volume: sound_volume)
    @score = Resources.sound("./assets/interface_sounds/drop_004.ogg", volume: sound_volume)
    @death = Resources.sound("./assets/interface_sounds/confirmation_002.ogg", volume: sound_volume)
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

  private

  def sound_volume
    @master_volume * @sound_volume
  end

  def music_volume
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
