@unit.describe "MainMenu::Button#initialize" do
  When "we initialise a new button" do
    @button = MainMenu::Button.new(
      test_id: "test id",
      text: "text"
    ) { "callback" }
  end

  Then "we have the expected attributes" do
    expect(@button.test_id).to_equal("test id")
    expect(@button.text).to_equal("text")
    expect(@button.callback).to_equal("callback")
  end
end
