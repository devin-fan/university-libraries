require 'test_helper'

class FilmControllerTest < ActionController::TestCase
    setup do
        create_films
    end

    setup do
        destroy_films
    end

    test "should get index" do
        get :index
        assert_response :success
        assert_not_nil assigns(:base_films)
    end

    test "should get new" do
        get :new
        assert_response :success
    end
end
