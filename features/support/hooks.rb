Before do |scenario|
  Runtime.set_log_filepath
  page.driver.browser.manage.window.maximize
  visit ''
  @step_count = 1
end

AfterStep do |scenario|
  take_screenshot(@step_count)
  @step_count += 1
end




