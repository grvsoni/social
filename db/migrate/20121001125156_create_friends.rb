class CreateFriends < ActiveRecord::Migration
  def up
  	create_table :friends, :id => false do |t|
  	  t.integer :user_id
  	  t.integer :friend_id
  	end
  end

  def down
  	drop_table :friends
  end
end
