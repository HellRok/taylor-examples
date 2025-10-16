module Resources
  @@fonts = {}

  def self.font(font, size: 22)
    @@fonts[[font, size]] ||= Font.new(font, size: size)
  end
end
