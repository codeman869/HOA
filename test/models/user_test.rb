require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Should not save user without email address" do
    me = User.new
    assert_not me.save, "User saved without an email"
  end
  
  test "User model should respond to admin role queries" do
    tom = users(:tom)
    assert_respond_to(tom, :admin?)
  end
  
  test "User model should respond to president role queries" do
    tom = users(:tom)
    assert_respond_to(tom, :president?)
  end
  
   test "User model should respond to treasurer role queries" do
    tom = users(:tom)
    assert_respond_to(tom, :treasurer?)
  end
  
   test "User model should respond to secretary role queries" do
    tom = users(:tom)
    assert_respond_to(tom, :secretary?)
  end
  
  test "If user is destroyed, unit should remain" do
    fred = users(:fred)
    fred.destroy()
    assert_not_nil(units(:two))
  end
  
  
end
