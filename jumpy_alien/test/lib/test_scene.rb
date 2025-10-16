class TestScene
  attr_accessor :update_called, :draw_called
  def update(_)
    @update_called = true
  end

  def draw
    @draw_called = true
  end
end
