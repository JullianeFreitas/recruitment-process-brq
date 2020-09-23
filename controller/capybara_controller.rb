require 'capybara'
require 'rspec'
require 'capybara/cucumber'
require_relative '../system/console'
include RSpec::Matchers

module Utils
  extend Capybara::DSL

  def self.validate_equal_field(expected, result)
    if expect(result).to eq(expected)
      Console.success("Expected: #{expected} | Result: #{result}")
    else
      Console.error_with_raise("Expected: #{expected} | Result: #{result}")
    end
  end

  def self.validate_current_path (page, path)
    begin
      expect(page).to have_current_path(path, url: true)
      Console.success("URL [#{path}].")
    rescue RSpec::Expectations::ExpectationNotMetError 
      Console.error_with_raise("Expected: #{path} | Result: #{page.current_path}")
    end
  end

  def self.convert_month_to_description(month)
    case month
    when "1"
      "January"
    when "2"
      "February"
    when "3"
      "March"
    when "4"
      "April"
    when "5"
        "May"
    when "6"
        "June"
    when "7"
        "July"
    when "8"
        "August"
    when "9"
        "September"
    when "10"
        "October"
    when "11"
        "November"
    when "12"
        "December"
    else
      null
    end
  end

end