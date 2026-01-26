def headless?
  headless = ENV.fetch("HEADLESS", "") != ""

  return headless || ENV.fetch("DISPLAY", "") == "" if Taylor::Platform.linux?

  headless
end
