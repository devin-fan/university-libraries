require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    setup do 
        create_users
    end

    teardown do
        destroy_users
    end

    test "should get index" do
        get :index
        assert_response :success
        assert_not_nil(:users)
    end

    test "should get new" do
        get :new
        assert_response :success
    end

    test "shoudl get create a new user" do
        assert_difference('User.count') do
            post :create, user: { first_name: "new", last_name: "user", role: 1, andrewid: "newu", password: "p", password_confirmation: "p" }
        end
        assert_redirected_to user_path(assigns(:item))
        post :create, user: { first_name: "not", last_name: "made", role: 1, andrewid: "notmade"}
        assert_template :new
    end
end
