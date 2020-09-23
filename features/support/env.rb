require 'capybara'
require 'capybara/cucumber'
require 'yaml'
require 'fuubar-cucumber'
require_relative '../../system/runtime'
require 'site_prism'
require_relative 'helper.rb'
require_relative '../../features/support/page_helper'

World(PageObjects)
World(Helper)

Capybara.default_max_wait_time = 12
Capybara.ignore_hidden_elements = false

#Leitura do arquivo de configuração e usando os dados para setar as informações de execução
settings_hash = YAML.load_file('system/config/settings.yml')
Runtime.set_settings(OpenStruct.new(settings_hash))



#Configurações do Capybara 
Capybara.configure do |config|
  #Por padrão, o driver usando é o Chrome. Caso deseje, pode ser passado pela linha de comando browser=Firefox
  if ENV['browser'].nil? || ENV['browser'].downcase == 'chrome'
    config.default_driver = :selenium_chrome
  elsif ENV['browser'].downcase == 'firefox'
    config.default_driver = :selenium
  end
  config.run_server = false
  config.app_host = Runtime.get_settings.url
end

Capybara.register_driver :firefox_timeout do |app|
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 25
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :http_client => client)
end

Capybara.register_driver :chrome_timeout do |app|
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 25
end

After do
  Capybara.current_session.driver.quit
end

