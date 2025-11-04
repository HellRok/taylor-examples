@headed.describe "Game::Pipes#initialize" do
  When "we initialise an pipes" do
    @pipes = Game::Pipes.new
  end

  Then "it has the expected attributes" do
    expect(@pipes.pipes).to_be_a(Array)
    expect(@pipes.texture).to_be_a(Texture2D)
    expect(@pipes.velocity).to_be_a(Vector2)
  end
end

@headed.describe "Game::Pipes#update" do
  Given "we have an pipes" do
    @pipes = Game::Pipes.new
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

  When "some more time passed" do
    @pipes.update(6.13)
  end

  Then "there is another pipe" do
    expect(@pipes.pipes.size).to_equal(3)
  end

  When "a bit more time passed" do
    @pipes.update(3)
  end

  Then "a pipe unloads" do
    expect(@pipes.pipes.size).to_equal(2)
  end
end
