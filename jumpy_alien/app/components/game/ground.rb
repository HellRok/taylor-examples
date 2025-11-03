class Game
  class Ground
    attr_accessor :time_passed, :texture

    def initialize
      @time_passed = 0
      generate_texture
    end

    def generate_texture
      tilemap = Resources.tilemaps("./assets/tiles.png", size: 18)
      image = tilemap.generate_from([
        [22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22],
        [122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122],
        [122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122],
        [122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122],
        [122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122]
      ])
      @texture = image.to_texture
    end

    def update(delta)
      @time_passed += delta
    end

    def position
      offset = (@time_passed * 36) % 18
      Vector2[
        200 - offset,
        600
      ]
    end

    def draw
      @texture.draw(
        position: position
      )
    end
  end
end
