require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  include Devise::TestHelpers
  
  
  test "Users who are not logged in cannot access the user overview" do 
    get :index 
    assert_response(:redirect)
    
  end
  
  test "Users who are not admin cannot access the user overview" do
    
    tom = users(:tom)
    
    sign_in tom
    
    get :index
    
    assert_response(:redirect)
    
  end
  
  test "Users who are admin can access the user overview" do
    
  end
  
end
