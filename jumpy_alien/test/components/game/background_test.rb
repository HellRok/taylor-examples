@headed.describe "Game::Background#initialize" do
  When "we initialize a background" do
    @background = Game::Background.new
  end

  Then "we get the correct attributes" do
    expect(@background.time_passed).to_equal(0)
    expect(@background.texture).to_be_a(Texture2D)
  end
end

@headed.describe "Game::Background#update" do
  Given "we have a background" do
    @background = Game::Background.new
  end

  When "we call update" do
    @background.update(0.016)
  end

  Then "the time_passed has been updated" do
    expect(@background.time_passed).to_equal(0.016)
  end

  When "we've been running a while" do
    5.times { @background.update(1) }
  end

  Then "we've tracked the passed time" do
    expect(@background.time_passed).to_equal(5.016)
  end
end

@headed.describe "Game::Background#position" do
  Given "we have a background" do
    @background = Game::Background.new
  end

  Then "we start at the start" do
    expect(@background.position.x).to_equal(240)
  end

  And "some time has passed" do
    @background.time_passed = 0.5
  end

  Then "position is updated" do
    expect(@background.position.x).to_equal(228)
  end

  When "we've been running a while" do
    @background.time_passed = 1
  end

  Then "the position has looped back" do
    expect(@background.position.x).to_equal(240)
  end
end

@headed.describe "Game::Background#generate_texture" do
  Given "we have a background" do
    @background = Game::Background.new
  end

  Then "we've built a background" do
    expect(@background.texture.width).to_equal(576)
    expect(@background.texture.height).to_equal(816)
  end
end
