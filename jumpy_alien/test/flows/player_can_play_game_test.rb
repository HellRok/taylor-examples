@flow.describe "Player can play the game" do
  Given "the player is on the main menu" do
    Scene.current = MainMenu.new
  end

  When "they press play" do
    Fragments::MainMenu.play!
  end

  Then "a swiping animation plays" do
    expect(Fragments::MainMenu.transitioning?).to_be_true
  end

  When "the animation finishes" do
    Fragments::MainMenu.finish_transition
  end

  Then "the player is in the game" do
    expect(Scene.current).to_be_a(Game)
  end

  And "their score is zero" do
    expect(Fragments::Game.score).to_equal(0)
  end

  When "they jump through a pipe" do
    Fragments::Game.jump_through_pipe
  end

  Then "their score increases" do
    expect(Fragments::Game.score).to_equal(1)
  end
end
