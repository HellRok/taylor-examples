class Game
  class Pipes
    attr_reader :pipes, :texture, :velocity

    def initialize
      @pipes = [Vector2[300, 300]]
      @velocity = Vector2[-36, 0]
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
    end
  end
end
