module Resources
  @@fonts = {}
  @@images = {}
  @@tilemaps = {}

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
end
