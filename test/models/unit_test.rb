require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "A user can only be assigned to one unit at a time" do
    three = units(:three)
    three.user_id = users(:pres).id 
    three.save
    assert_equal units(:four).user_id, 0
    
  end
end
