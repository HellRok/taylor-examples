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

@unit.describe "MainMenu::Button#click" do
  Given "we have a button" do
    @callback_trigger_count = 0
    @button = MainMenu::Button.new(
      test_id: "test id",
      text: "text",
      position: Rectangle[1, 2, 3, 4]
    ) { @callback_trigger_count += 1 }
  end

  When "we call #click" do
    @button.click
  end

  Then "the callback has been fired" do
    expect(@callback_trigger_count).to_equal(1)
  end

  But "if we call #click again" do
    @button.click
  end

  Then "the callback has not been fired" do
    expect(@callback_trigger_count).to_equal(1)
  end
end

@unit.describe "MainMenu::Button#hover?" do
  Given "we have a button" do
    @button = MainMenu::Button.new(
      test_id: "test id",
      text: "text",
      position: Rectangle[10, 20, 10, 20]
    ) {}
  end

  When "the mouse is outside of the button" do
    Mouse.position = Vector2[1, 2]
  end

  Then "return false" do
    expect(@button.hover?).to_be_false
  end

  But "if the mouse is moved over the button" do
    Mouse.position = Vector2[15, 30]
  end

  Then "return true" do
    expect(@button.hover?).to_be_true
  end
end

@unit.describe "MainMenu::Button#clocked?" do
  Given "we have a button" do
    @button = MainMenu::Button.new(
      test_id: "test id",
      text: "text",
      position: Rectangle[10, 20, 10, 20]
    ) {}
  end

  When "the mouse is outside of the button" do
    Mouse.position = Vector2[1, 2]
  end

  And "we click" do
    Mouse.pressed = true
  end

  Then "return false" do
    expect(@button.clicked?).to_be_false
  end

  But "if the mouse is moved over the button" do
    Mouse.position = Vector2[15, 30]
  end

  And "we don't click" do
    Mouse.pressed = false
  end

  Then "return false" do
    expect(@button.clicked?).to_be_false
  end

  But "if we do click" do
    Mouse.pressed = true
  end

  Then "return true" do
    expect(@button.clicked?).to_be_true
  end
end
