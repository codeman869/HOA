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
  
  test "Users with the president role can edit a unit" do
    sign_in users(:pres)
    get :edit, {:id => units(:two).id} 
    assert_response(:success)
    
  end
  
  test "Users without the president role cannot edit a unit" do
    sign_in users(:frank)
    get :edit, {:id => units(:two).id}
    assert_response(:redirect)
  end
  
end
