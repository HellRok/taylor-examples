class Game
  class Alien
    attr_reader :alien, :position, :velocity, :up_texture, :down_texture

    TILES = {
      green: {up: 0, down: 1}
    }

    GRAVITY = 8
    MAX_FALL_VELOCITY = 4
    JUMP = -3

    def initialize
      @alien = :green
      @position = Vector2[180, 300]
      @velocity = Vector2[0, 0]
      generate_textures
    end

    def generate_textures
      tilemap = Resources.tilemaps("./assets/characters.png", size: 24)

      @up_texture = tilemap.tile_for(TILES[@alien][:up]).flip_horizontally!.to_texture
      @down_texture = tilemap.tile_for(TILES[@alien][:down]).flip_horizontally!.to_texture
    end

    def update(delta)
      @velocity.y += GRAVITY * delta

      @velocity.y = MAX_FALL_VELOCITY if @velocity.y > MAX_FALL_VELOCITY

      @velocity.y = JUMP if Mouse.pressed?(Mouse::LEFT)

      @position += @velocity
    end

    def draw
      @up_texture.draw(
        position: position
      )
    end
  end
end
