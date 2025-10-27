@unit = Neospec::Suite.new
@flow = Neospec::Suite.new
neospec = Neospec.new(suites: [@unit, @flow])

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
require "test/components/main_menu/button_test"

neospec.run!
