class Scene
  @@current = nil
  def self.current = @@current

  def self.current=(new_scene)
    @@current = new_scene
  end

  def self.update(delta) = current.update(delta)
  def self.draw = current.draw
end
