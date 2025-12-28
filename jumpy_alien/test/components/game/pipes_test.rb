@headed.describe "Game::Pipes#initialize" do
  When "we initialise pipes" do
    @pipes = Game::Pipes.new
  end

  Then "it has the expected attributes" do
    expect(@pipes.pipes).to_be_a(Array)
    expect(@pipes.texture).to_be_a(Texture2D)
    expect(@pipes.velocity).to_be_a(Vector2)
  end
end

@headed.describe "Game::Pipes#update" do
  Given "we have pipes" do
    @spawn_count = 0
    @pipes = Game::Pipes.new(on_spawn: -> { @spawn_count += 1 })
  end

  Then "there is a pipe" do
    expect(@pipes.pipes.size).to_equal(1)
  end

  When "some time passed" do
    @pipes.update(3.5)
  end

  Then "there is another pipe" do
    expect(@pipes.pipes.size).to_equal(2)
  end

  And "on_spawn was called" do
    expect(@spawn_count).to_equal(1)
  end

  When "some more time passed" do
    @pipes.update(6.13)
  end

  Then "there is another pipe" do
    expect(@pipes.pipes.size).to_equal(3)
  end

  And "on_spawn was called" do
    expect(@spawn_count).to_equal(2)
  end

  When "a bit more time passed" do
    @pipes.update(3)
  end

  Then "a pipe unloads" do
    expect(@pipes.pipes.size).to_equal(2)
  end
end

@headed.describe "Game::Pipes#hitboxes" do
  Given "we have pipes" do
    @pipes = Game::Pipes.new
    @pipes.update(3.5)
  end

  Then "return the hitboxes for those pipes" do
    hitboxes = @pipes.hitboxes
    expect(hitboxes.size).to_equal(4)

    # First pipe
    expect(hitboxes[0].to_h.slice(:x, :y, :width, :height)).to_equal({x: 167.0, y: -13.0, width: 14.0, height: 266.0})
    expect(hitboxes[1].to_h.slice(:x, :y, :width, :height)).to_equal({x: 167.0, y: 347.0, width: 14.0, height: 266.0})

    # Second pipe
    expect(hitboxes[2].to_h.slice(:x, :y, :width, :height)).to_equal({x: 393.0, y: -13.0, width: 14.0, height: 266.0})
    expect(hitboxes[3].to_h.slice(:x, :y, :width, :height)).to_equal({x: 393.0, y: 347.0, width: 14.0, height: 266.0})
  end
end
