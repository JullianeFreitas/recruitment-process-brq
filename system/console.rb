require 'colorize'

module Console

  def self.debug(message)
    timestamp = Time.now.strftime '%d-%m-%Y %H:%M:%S'
    puts "[DEBUG][#{timestamp}] #{message}".white
  end

  def self.warn(message)
    timestamp = Time.now.strftime '%d-%m-%Y %H:%M:%S'
    puts "[WARN][#{timestamp}] #{message}".yellow
  end

  def self.error(message)
    timestamp = Time.now.strftime '%d-%m-%Y %H:%M:%S'
    puts "[WARN][#{timestamp}] #{message}".red
  end

  def self.error_with_raise(message)
    timestamp = Time.now.strftime '%d-%m-%Y %H:%M:%S'
    raise "[WARN][#{timestamp}] #{message}"
  end

  def self.info(message)
    timestamp = Time.now.strftime '%d-%m-%Y %H:%M:%S'
    puts "[INFO][#{timestamp}] #{message}".blue
  end

  def self.success(message)
    timestamp = Time.now.strftime '%d-%m-%Y %H:%M:%S'
    puts "[SUCCESS][#{timestamp}] #{message}".green
  end

end