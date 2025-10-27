@headed.describe "Game#initialize" do
  When "we initialize a game" do
    @game = Game.new
  end

  Then "we have the expected attributes" do
    expect(@game.score).to_be_a(Game::Score)
    expect(@game.alien).to_be_a(Game::Alien)
    expect(@game.background).to_be_a(Game::Background)
    expect(@game.ground).to_be_a(Game::Ground)
    expect(@game.pipes).to_be_a(Game::Pipes)
  end
end

@headed.describe "Game#jump_through_pipe" do
  Given "we have a game" do
    @game = Game.new
  end

  When "we jump through a pipe" do
    @game.jump_through_pipe
  end

  Then "our score goes up" do
    expect(@game.score.score).to_equal(1)
  end
end
