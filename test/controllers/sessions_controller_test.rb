require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
    setup do
        create_users
    end

    teardown do
        destroy_users
    end

    test "should get new" do
        get :new
        assert_response :success
    end

    test "should create a new session" do
        post :create, params: { andrewid: 'testu', password: 'password' }
        assert_redirected_to home_path
    end
end
