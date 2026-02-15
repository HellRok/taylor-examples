class Game
  class Pipes
    attr_reader :alien, :pipes, :texture, :velocity

    def initialize(
      alien: nil,
      on_collision: -> {},
      on_jumped_through: -> {}
    )
      @alien = alien
      @pipes = [Vector2[300, 0]]
      @velocity = Vector2[-36, 0]
      @on_collision = on_collision
      @on_jumped_through = on_jumped_through
      generate_texture
    end

    def generate_texture
      tilemap = Resources.tilemaps("./assets/tiles.png", size: 18)
      image = tilemap.generate_from([
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [135],
        [],
        [],
        [],
        [],
        [],
        [95],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115],
        [115]
      ])
      @texture = image.to_texture
    end

    def spawn_pipe
      @pipes.push(Vector2[400, 0])
    end

    def update(delta)
      @pipes.map! do |pipe|
        pipe + @velocity * delta
      end

      if @pipes.last.x < 180
        spawn_pipe
        @on_jumped_through.call
      end

      @pipes.shift if @pipes.first.x < -50

      check_for_collisions

      Scene.debug_info[:pipe_count] = @pipes.count
    end

    def draw
      @pipes.each do |pipe|
        @texture.draw(position: pipe)
      end

      hitboxes.each(&:draw) if Scene::DEBUG
    end

    def hitboxes
      buffer = 2 # 2 pixels of leniency
      gap = 5 * 18 # 5 tiles of gap
      width = @texture.width - (buffer * 2)
      height = ((@texture.height - gap) / 2) - (buffer * 2)

      # 15 pipe tiles
      offset_y = (15 * 18) + gap + buffer

      @pipes.flat_map do |pipe|
        [
          Rectangle.new(
            x: pipe.x + buffer, y: pipe.y,
            width: width, height: height,
            colour: Colour::BLANK,
            outline: Colour::GREEN
          ),
          Rectangle.new(
            x: pipe.x + buffer, y: pipe.y + offset_y,
            width: width, height: height,
            colour: Colour::BLANK,
            outline: Colour::RED
          )
        ]
      end
    end

    def check_for_collisions
      hit = hitboxes.any? do |pipe_hitbox|
        pipe_hitbox.x < (@alien.hitbox.x + @alien.hitbox.width) &&
          (pipe_hitbox.x + pipe_hitbox.width) > @alien.hitbox.x &&
          pipe_hitbox.y < (@alien.hitbox.y + @alien.hitbox.height) &&
          (pipe_hitbox.y + pipe_hitbox.height) > @alien.hitbox.y
      end

      @on_collision.call if hit
    end
  end
end
