@headed.describe "Play through a session and restart" do
  Given "we have a game" do
    @game = Game.new
    Scene.current = @game
  end

  When "we jump through a pipe" do
    @game.jump_through_pipe
  end

  Then "our score goes up" do
    expect(@game.score.score).to_equal(1)
  end

  But "we hit a pipe" do
    @game.player_died
  end

  Then "We see the end screen with our score" do
    expect(@game.end_screen.score).to_equal(1)
  end

  When "We click retry" do
    @game.end_screen.retry!
    @game.end_screen.transition.callback.call
  end

  Then "the game is reset" do
    expect(Scene.current).not_to_equal(@game)
  end
end
