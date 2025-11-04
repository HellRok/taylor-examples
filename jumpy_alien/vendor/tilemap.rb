class Tilemap
  def initialize(image:, size:)
    @image = image
    @size = size
  end

  def tile_count
    (@image.width / @size) * (@image.height / @size)
  end

  def tiles_per_row
    @image.width / @size
  end

  def source_for(id)
    x = id % tiles_per_row
    y = (id / tiles_per_row.to_f).floor
    Rectangle.new(x: x * @size, y: y * @size, width: @size, height: @size)
  end

  def tile_for(id)
    tile = Image.generate(width: @size, height: @size)
    tile.draw!(
      image: @image,
      source: source_for(id)
    )
  end

  def generate_from(ids)
    @width = ids.first.size
    @height = ids.size

    map = Image.generate(width: @width * @size, height: @height * @size)

    ids.each.with_index { |row, y|
      row.each.with_index { |id, x|
        unless id.negative?
          map.draw!(
            image: @image,
            source: source_for(id),
            destination: Rectangle.new(x: x * @size, y: y * @size, width: @size, height: @size)
          )
        end
      }
    }

    map
  end
end
