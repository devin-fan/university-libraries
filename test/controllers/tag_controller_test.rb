require 'test_helper'

class TagsControllerTest < ActionController::TestCase
    setup do
        create_tags
    end

    teardown do
        destroy_tags
    end
    

    test "should get index" do
        get :index
        assert_response :success
        assert_not_nil assigns(:tags)
    end

    test "should get show" do
        get :show, id: @tag_one
        assert_not_nil assigns(:tag)
        assert_not_nil assigns(:tagged_films)
        assert_response :success
    end
    
end 
