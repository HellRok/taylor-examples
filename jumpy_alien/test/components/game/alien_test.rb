@headed.describe "Game::Alien#initialize" do
  When "we initialise an alien" do
    @alien = Game::Alien.new
  end

  Then "it has the expected attributes" do
    expect(@alien.alien).to_be_a(Symbol)
    expect(@alien.position).to_be_a(Vector2)
    expect(@alien.velocity).to_be_a(Vector2)
    expect(@alien.up_texture).to_be_a(Texture2D)
    expect(@alien.down_texture).to_be_a(Texture2D)
  end
end

@headed.describe "Game::Alien#update" do
  Given "we have an alien" do
    Mouse.pressed = false
    @alien = Game::Alien.new
  end

  Then "it starts with a velocity of 0" do
    expect(@alien.velocity.y).to_equal(0)
  end

  When "some time passes without input" do
    @alien.update(0.016)
  end

  Then "the velocity has increased" do
    expect(@alien.velocity.y.positive?).to_be_true
  end

  But "if the player clicks" do
    Mouse.pressed = true
    @alien.update(0.016)
  end

  Then "the velocity has a burst" do
    expect(@alien.velocity.y.negative?).to_be_true
  end
end
