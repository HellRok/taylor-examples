class Game
  class Alien
    attr_reader :alien, :position, :velocity, :up_texture, :down_texture, :hitbox, :state

    TILES = {
      green: {up: 0, down: 1}
    }

    GRAVITY = 8
    MAX_FALL_VELOCITY = 4
    JUMP = -3

    def initialize
      @state = :alive
      @alien = :green
      @position = Vector2[180, 300]
      @velocity = Vector2[0, 0]
      @hitbox = Rectangle.new(
        x: @position.x - 8, y: @position.y - 8,
        width: 16, height: 16,
        colour: Colour::BLANK,
        outline: Colour::BLUE
      )
      generate_textures
    end

    def generate_textures
      tilemap = Resources.tilemaps("./assets/characters.png", size: 24)

      @up_texture = tilemap.tile_for(TILES[@alien][:up]).flip_horizontally!.to_texture
      @down_texture = tilemap.tile_for(TILES[@alien][:down]).flip_horizontally!.to_texture
    end

    def jump_pressed?
      Mouse.pressed?(Mouse::LEFT) || Key.pressed?(Key::SPACE)
    end

    def update(delta)
      case @state
      when :alive
        @velocity.y += GRAVITY * delta

        @velocity.y = MAX_FALL_VELOCITY if @velocity.y > MAX_FALL_VELOCITY

        @velocity.y = JUMP if jump_pressed?

        @position += @velocity
        @hitbox.x = @position.x - 8
        @hitbox.y = @position.y - 8
      end
    end

    def draw
      case @state
      when :alive
        @up_texture.draw(
          position: position
        )

      when :dead
        Rectangle.new(
          x: @position.x - 16,
          y: @position.y - 16,
          width: 32,
          height: 32,
          colour: Colour::RED,
          outline: Colour::ORANGE,
          thickness: 3
        ).draw
      end

      @hitbox.draw if Scene::DEBUG
    end

    def kill = @state = :dead
  end
end
