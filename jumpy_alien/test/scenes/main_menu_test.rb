@unit.describe "MainMenu#draw" do
  Given "we have a main menu" do
    @main_menu = MainMenu.new
  end

  Then "it responds to #draw" do
    expect(@main_menu.respond_to?(:draw)).to_be_true
  end
end

@unit.describe "MainMenu#initialize" do
  Given "we initialise a main menu" do
    @main_menu = MainMenu.new
    Scene.current = @main_menu
  end

  Then "it has a play button" do
    expect(Fragments::MainMenu.play_button.test_id).to_equal(:play_button)
  end

  And "it has a settings button" do
    expect(Fragments::MainMenu.settings_button.test_id).to_equal(:settings_button)
  end

  And "it has a quit button" do
    expect(Fragments::MainMenu.quit_button.test_id).to_equal(:quit_button)
  end
end

@unit.describe "MainMenu#update" do
end
