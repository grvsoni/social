class Book < ActiveRecord::Base
  attr_accessible :author, :date_of_publish, :name, :price, :publiser, :summary

  def method2
  	puts "hello"
  end

  def method3
  	puts "world"
  end
end
