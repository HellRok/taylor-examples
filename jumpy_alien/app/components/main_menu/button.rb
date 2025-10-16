class MainMenu
  class Button
    attr_reader :test_id, :text, :callback

    def initialize(test_id:, text:, &block)
      @test_id = test_id
      @text = text
      @callback = block
    end
  end
end
