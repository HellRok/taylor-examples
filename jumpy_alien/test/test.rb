$: << "./vendor"

@unit = Neospec::Suite.new
@headed = Neospec::Suite.new
@headed.setup do
  Window.open(width: 100, height: 100, title: "=== Tests ===")
end
@headed.teardown do
  Window.close
end

neospec = Neospec.new(suites: [@unit])
neospec.suites << @headed unless ENV["HEADLESS"]

require "tilemap"

require "app/models/resources"
require "app/models/scene"
require "app/scenes/main_menu"
require "app/scenes/game"

require "test/lib/test_scene"
require "test/lib/fragments/main_menu"
require "test/lib/fragments/game"
require "test/lib/mocks/mouse"

require "test/flows/player_can_play_game_test"

require "test/models/scene_test"
require "test/scenes/game_test"
require "test/scenes/main_menu_test"
require "test/components/fade_out_test"
require "test/components/game/background_test"
require "test/components/game/ground_test"
require "test/components/game/alien_test"
require "test/components/main_menu/button_test"

neospec.run!
