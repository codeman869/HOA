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
end
