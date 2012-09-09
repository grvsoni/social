require_relative '../spec_helper'
describe User do
  context "while creating a user" do
    let(:user) {User.new({:email => "some@email.com", :password => "some_pass"})}

    it "should validate first name" do
      user.should_not be_valid
      user.errors[:first_name].should be_present
    end
    it "should validate last name" do
      user.should_not be_valid
      user.errors[:last_name].should be_present
    end
  end
end