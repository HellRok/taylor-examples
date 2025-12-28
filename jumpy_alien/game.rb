# Add the path ./vendor so we can easily require third party libraries.
$: << "./vendor"

require "tilemap"

require "app/models/scene"
require "app/models/resources"

require "app/scenes/main_menu"
require "app/scenes/game"

# Open up a window
Window.open(width: 360, height: 600, title: "Jumpy Alien")

# Setup audio so we can play sounds
Audio.open

# Get the current monitor frame rate and set our target framerate to match.
Window.target_frame_rate = Monitor.current.refresh_rate

Scene.current = MainMenu.new
Scene.current = Game.new if Scene::DEBUG

# Define your main method
def main
  # Get the amount of time passed since the last frame was rendered
  delta = Window.frame_time

  # Your update logic goes here
  Scene.update(delta)

  Window.draw do
    # Your drawing logic goes here

    Scene.draw
  end
end

if Taylor::Platform.browser?
  Browser.main_loop = "main"
else
  # Detect window close button or ESC key
  main until Window.close?
end

Audio.close
Window.close
