require 'test_helper'

class UnitsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "Users who are not logged in cannot access the units overview" do
    get :index
    assert_response(:redirect)
  end
  
  test "Users without the president role cannot access the unit overview" do
    sign_in users(:tom)
    get :index
    assert_response(:redirect)
  end
  
  test "Users with the president role can access the unit overview" do
    sign_in users(:pres)
    get :index
    assert_response(:success)
  end
  
end
