require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Should not save user without email address" do
    me = User.new
    assert_not me.save, "User saved without an email"
  end
  
  test "Emails should be unique" do
    
      tom = User.new(:email =>"tom@test-domain.com", :encrypted_password => "password")
      tom.save
      fred = User.new(:email => "tom@test-domain.com", :encrypted_password => "password2")
      assert_not fred.save, "User saved with the same email address"
      
    
    
  end
  
  
end
