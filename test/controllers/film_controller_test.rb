require 'test_helper'

class FilmsControllerTest < ActionController::TestCase
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

    test "should show film" do
       get :show, id: @film_one
       assert_not_nil assigns(:film)
       assert_response :success
    end
    
    test "should get edit" do
        get :edit, id: @film_one
        assert_not_nil assigns(:film)
        assert_response :success 
    end

    test "should update a film" do
        patch :update, id: @film_one, film: { title: "test film update", director: @film_one.director, film_type: @film_one.film_type, film_path: @film_one.film_path, essay_path: @film_one.essay_path, permission: @film_one.permission, description: @film_one.description }
        assert_redirect_to film_path(assigns(:film))
        patch :update, id: @film_one, film: { title: "test film update", director: @film_one.director, film_type: @film_one.film_type, film_path: @film_one.film_path, essay_path: @film_one.essay_path, permission: -1, description: @film_one.description }
        assert_template :edit
    end

    test "should destroy film" do
        assert_difference('Film.count', -1) do
            delete :destroy, id: @film_one
        end
        assert_redirected_to films_path
    end
end
