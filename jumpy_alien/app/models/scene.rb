class Scene
  DEBUG = ENV.fetch("DEBUG", false)
  @debug_info = {}
  @current = nil
  @should_close = false

  def self.debug_info = @debug_info

  def self.current = @current

  def self.current=(new_scene)
    @current = new_scene
  end

  def self.update(delta)
    @debug_info = {}
    @debug_info.merge! ObjectSpace.count_objects
    current.update(delta)
  end

  def self.draw
    current.draw
    if DEBUG
      Window.draw_frame_rate
      Font.default.draw(
        @debug_info.map { |key, value|
          "#{key}: #{value}"
        }.join("\n"),
        colour: Colour::DARKGREEN,
        position: Vector2[10, 32],
        size: 20
      )
    end
  end

  def self.close
    @should_close = true
  end

  def self.close?
    Window.close? || @should_close
  end
end
