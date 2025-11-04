class Game
  class Alien
    attr_reader :alien, :position, :velocity, :up_texture, :down_texture

    TILES = {
      green: {up: 0, down: 1}
    }

    def initialize
      @alien = :green
      @position = Vector2[200, 300]
      @velocity = Vector2[0, 0]
      generate_textures
    end

    def generate_textures
      tilemap = Resources.tilemaps("./assets/characters.png", size: 24)

      @up_texture = tilemap.tile_for(TILES[@alien][:up]).to_texture
      @down_texture = tilemap.tile_for(TILES[@alien][:down]).to_texture
    end
  end
end
