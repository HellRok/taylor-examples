module Resources
  @@fonts = {}
  @@images = {}
  @@tilemaps = {}
  @@music = {}
  @@sounds = {}

  def self.font(font, size: 22)
    @@fonts[[font, size]] ||= Font.new(font, size: size)
  end

  def self.image(path)
    @@images[path] ||= Image.new(path)
  end

  def self.tilemaps(path, size:)
    @@tilemaps[[path, size]] ||= Tilemap.new(
      image: image(path),
      size: size
    )
  end

  def self.music(path, volume:)
    @@music[path] ||= Music.new(path, volume: volume)
  end

  def self.sound(path, volume:)
    @@sounds[path] ||= Sound.new(path, volume: volume)
  end
end
