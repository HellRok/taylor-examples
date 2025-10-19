class FadeOut
  attr_reader :callback, :time_left

  def initialize(&block)
    @callback = block
    @time_left = 0.125
  end

  def update(delta)
    @time_left -= delta

    @callback.call if @time_left <= 0
  end

  def draw
  end
end
