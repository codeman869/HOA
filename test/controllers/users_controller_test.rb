require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  
  
  test "Users who are not logged in cannot access the user overview" do 
    get :index 
    assert_response(:redirect)
    
  end
  
  test "Users who are not admin cannot access the user overview" do
    sign_in users(:tom)
    get :index
    assert_response(:redirect)
    
  end
  
  test "Users who are admin can access the user overview" do
    sign_in users(:frank)
    get :index
    assert_response(:success)
  end
  
  
  
end
