class AddUserProfileInfo < ActiveRecord::Migration
  def change
  	add_column :users, :date_of_birth, :date, :first => true
  	add_column :users, :gender, :string, :first => true
  	add_column :users, :last_name, :string, :first => true
  	add_column :users, :first_name, :string, :first => true
  end
end
