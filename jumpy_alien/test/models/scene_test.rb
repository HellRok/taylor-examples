@unit.describe "Scene#current" do
  When "we set #current" do
    Scene.current = "hello"
  end

  Then "it is persisted" do
    expect(Scene.current).to_equal("hello")
  end
end

@unit.describe "Scene#update" do
  Given "we have a scene setup" do
    @scene = TestScene.new
    Scene.current = @scene
  end

  When "we call update" do
    Scene.update("delta")
  end

  Then "#update was called on the scene" do
    expect(@scene.update_called).to_be_true
    expect(@scene.draw_called).to_be_nil
  end
end

@unit.describe "Scene#draw" do
  Given "we have a scene setup" do
    @scene = TestScene.new
    Scene.current = @scene
  end

  When "we call draw" do
    Scene.draw
  end

  Then "#draw was called on the scene" do
    expect(@scene.update_called).to_be_nil
    expect(@scene.draw_called).to_be_true
  end
end
