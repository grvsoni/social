class Book < ActiveRecord::Base
  attr_accessible :author, :date_of_publish, :name, :price, :publiser, :summary

  def method1
  end
end
