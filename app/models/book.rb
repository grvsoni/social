class Book < ActiveRecord::Base
  attr_accessible :author, :date_of_publish, :name, :price, :publiser, :summary

  def method1
  	puts "1"
  end

  def method2
  	puts "3"
  end
end
