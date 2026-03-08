module Fragments
  class SettingsMenu
    def self.settings_menu
      raise "Incorrect scene" unless Scene.current.is_a?(::SettingsMenu)
      Scene.current
    end

    def self.back_button = settings_menu.instance_variable_get(:@back_button)
    def self.transition = settings_menu.instance_variable_get(:@transition)

    def self.back! = back_button.click
    def self.transitioning? = !transition.nil?
    def self.finish_transition = transition.update(1)
  end
end
