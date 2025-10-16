class FadeOut
  attr_reader :callback

  def initialize(&block)
    @callback = block
  end
end
