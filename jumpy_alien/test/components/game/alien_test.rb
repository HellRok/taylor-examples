@headed.describe "Game::Alien.initialize" do
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
