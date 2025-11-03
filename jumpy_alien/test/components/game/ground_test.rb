@headed.describe "Game::Ground#initialize" do
  When "we initialize a ground" do
    @ground = Game::Ground.new
  end

  Then "we get the correct attributes" do
    expect(@ground.time_passed).to_equal(0)
    expect(@ground.texture).to_be_a(Texture2D)
  end
end

@headed.describe "Game::Ground#update" do
  Given "we have a ground" do
    @ground = Game::Ground.new
  end

  When "we call update" do
    @ground.update(0.016)
  end

  Then "the time_passed has been updated" do
    expect(@ground.time_passed).to_equal(0.016)
  end

  When "we've been running a while" do
    5.times { @ground.update(1) }
  end

  Then "we've tracked the passed time" do
    expect(@ground.time_passed).to_equal(5.016)
  end
end

@headed.describe "Game::Ground#position" do
  Given "we have a ground" do
    @ground = Game::Ground.new
  end

  Then "we start at the start" do
    expect(@ground.position.x).to_equal(200)
  end

  And "some time has passed" do
    @ground.time_passed = 0.25
  end

  Then "position is updated" do
    expect(@ground.position.x).to_equal(191)
  end

  When "we've been running a while" do
    @ground.time_passed = 0.5
  end

  Then "the position has looped back" do
    expect(@ground.position.x).to_equal(200)
  end
end

@headed.describe "Game::Ground#generate_texture" do
  Given "we have a ground" do
    @ground = Game::Ground.new
  end

  Then "we've built a ground" do
    expect(@ground.texture.width).to_equal(432)
    expect(@ground.texture.height).to_equal(90)
  end
end
