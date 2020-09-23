Dir[File.join(File.dirname(__FILE__), '../pages/*_object.rb')].each { |file| require file}


module PageObjects

  def store
    @store ||= StoreObject.new
  end

  def cart
    @cart ||= CartObject.new
  end

end