@unit.describe "MainMenu::Button#initialize" do
  When "we initialise a new button" do
    @button = MainMenu::Button.new(
      test_id: "test id",
      text: "text",
      position: Rectangle[1, 2, 3, 4]
    ) { "callback" }
  end

  Then "we have the expected attributes" do
    expect(@button.test_id).to_equal("test id")
    expect(@button.text).to_equal("text")
    expect(@button.position).to_be_a(Rectangle)
    expect(@button.callback).to_equal("callback")
  end
end

@unit.describe "MainMenu::Button#draw" do
  Given "we have a button" do
    @button = MainMenu::Button.new(
      test_id: "test id",
      text: "text",
      position: Rectangle[1, 2, 3, 4]
    ) { "callback" }
  end

  Then "it responds to #draw" do
    expect(@button.respond_to?(:draw)).to_be_true
  end
end
