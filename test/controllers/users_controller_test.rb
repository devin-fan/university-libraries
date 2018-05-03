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
        assert_not_nil assigns(:users)
    end

    test "should get new" do
        get :new
        assert_response :success
    end

    test "should get create a new user" do
        @new_user = FactoryBot.build(:user)
        assert_equal @new_user.password, "password"
        assert_difference('User.count') do
            post :create, user: { first_name: @new_user.first_name, last_name: @new_user.last_name, andrewid: @new_user.andrewid, password: "password", password_confirmation: "password" }
        end
        assert_redirected_to user_path(assigns(:user))
        post :create, user: { first_name: "not", last_name: "made", role: 1, andrewid: "notmade"}
        assert_template :new
    end

    test "should get edit" do
        get :edit
        assert_response :success
        assert_not_nil assigns(:user)
    end

    test "should update user" do
        patch :update, id: @user_one, user: { first_name: "different" }
        assert_redirected_to user_path(assigns(:user))
        patch :update, id: @user_one, user: { first_name: nil }
        assert_template :edit
    end

    test "should destroy user" do
        @user_destory = FactoryBot.create(:user)
        assert_difference('User.count', -1) do
            delete :destroy, id: @user_destroy
        end
        assert_redirected_to users_path
    end
    
end
