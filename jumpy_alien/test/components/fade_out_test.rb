@unit.describe "FadeOut#initialize" do
  When "we initialise a fade out" do
    @fade_out = FadeOut.new { "block" }
  end

  Then "it has the correct attributes" do
    expect(@fade_out.callback).to_equal("block")
    expect(@fade_out.time_left).to_equal(0.125)
  end
end

@unit.describe "FadeOut#update" do
  Given "we have a fade out" do
    @callback_triggered = false
    @fade_out = FadeOut.new { @callback_triggered = true }
  end

  When "we call update" do
    @fade_out.update(0.025)
  end

  Then "the delta is removed from time left" do
    expect(@fade_out.time_left).to_equal(0.1)
  end

  When "time left becomes 0" do
    @fade_out.update(0.1)
  end

  Then "the callback is triggered" do
    expect(@callback_triggered).to_be_true
  end
end
