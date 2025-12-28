class Game
  class Pipes
    attr_reader :pipes, :texture, :velocity

    def initialize(on_spawn: -> {})
      @pipes = [Vector2[300, 300]]
      @velocity = Vector2[-36, 0]
      @on_spawn = on_spawn
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
      @pipes.push(Vector2[400, 300])
      @on_spawn.call
    end

    def update(delta)
      @pipes.map! do |pipe|
        pipe + @velocity * delta
      end

      spawn_pipe if @pipes.last.x < 180
      @pipes.shift if @pipes.first.x < -50

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
      offset_x = (@texture.width / 2) - buffer
      offset_y_top = (gap / 2) + buffer + height
      offset_y_bottom = (gap / 2) + buffer

      @pipes.flat_map do |pipe|
        [
          Rectangle.new(
            x: pipe.x - offset_x, y: pipe.y - offset_y_top,
            width: width, height: height,
            colour: Colour::BLANK,
            outline: Colour::RED
          ),
          Rectangle.new(
            x: pipe.x - offset_x, y: pipe.y + offset_y_bottom,
            width: width, height: height,
            colour: Colour::BLANK,
            outline: Colour::RED
          )
        ]
      end
    end
  end
end
