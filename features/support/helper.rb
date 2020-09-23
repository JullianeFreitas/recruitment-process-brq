module Helper

  def take_screenshot(filename)
    if Runtime.get_settings.save_evidences
      filepath = Runtime.get_log_filepath
      screenshot = "#{filepath}/#{filename}.png"
      save_screenshot(screenshot)
      embed(screenshot, 'image/png', '')
    end
  end
end