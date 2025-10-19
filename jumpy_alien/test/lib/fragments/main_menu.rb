module Fragments
  class MainMenu
    def self.main_menu
      raise "Incorrect scene" unless Scene.current.is_a?(::MainMenu)
      Scene.current
    end

    def self.play_button = main_menu.instance_variable_get(:@play_button)
    def self.settings_button = main_menu.instance_variable_get(:@settings_button)
    def self.quit_button = main_menu.instance_variable_get(:@quit_button)
    def self.transition = main_menu.instance_variable_get(:@transition)

    def self.play! = play_button.click
    def self.transitioning? = !transition.nil?
    def self.finish_transition = transition.update(1)
  end
end
