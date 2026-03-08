@unit.describe "SettingsMenu#draw" do
  Given "we have a settings menu" do
    @settings_menu = SettingsMenu.new
  end

  Then "it responds to #draw" do
    expect(@settings_menu.respond_to?(:draw)).to_be_true
  end
end

@unit.describe "SettingsMenu#initialize" do
  Given "we initialise a settings menu" do
    @settings_menu = SettingsMenu.new
    Scene.current = @settings_menu
  end

  And "it has a back button" do
    expect(Fragments::SettingsMenu.back_button.test_id).to_equal(:back_button)
  end
end

@unit.describe "SettingsMenu#update" do
end
