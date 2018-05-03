require 'test_helper'

class FilmsControllerTest < ActionController::TestCase
    setup do
        create_films
    end

    teardown do
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
        patch :update, id: @film_one, film: { title: "different" }
        assert_redirected_to film_path(assigns(:film))
        patch :update, id: @film_one, film: { title: "test film update", director: @film_one.director, film_type: @film_one.film_type, film_path: @film_one.film_path, essay_path: @film_one.essay_path, permission: -1, description: @film_one.description }
        assert_template :edit
    end

    test "should download film" do
        get :download, id: @film_one
        assert_redirected_to @film_one.film_path.url
        get :download, id: @base_film_one
        assert_redirected_to @base_film_one.base_film_path.url
    end

    test "should search films" do
        get :search, search: "film"
        assert_response :success
        assert_not_nil assigns(:matched_by_title)
        assert_not_nil assigns(:matched_by_director)
        assert_not_nil assigns(:matched_by_tag)
    end

    test "should render admin form" do
        get :admin_form
        assert_response :success
    end
    
    test "should create a new film" do
        @test_film_new = FactoryBot.build(:film)
        assert_difference('Film.count') do
            post :create, film: { title: @test_film_new.title, director: "p", film_type: 0, film_path: Rack::Test::UploadedFile.new(Rails.root.join("public/uploads/student_films/video-1517172393.mp4"), 'video/mp4'), tag_names: "tag", permission: 1 }
        end
        assert_redirected_to film_path(assigns(:film))
        @test_film_new.film_type = nil
        assert_difference('Film.count') do
            post :create, film: @test_film_new.attributes.merge(film_path: Rack::Test::UploadedFile.new(Rails.root.join("public/uploads/student_films/video-1517172393.mp4"), 'video/mp4'))
        end
        assert_redirected_to film_path(assigns(:film))
        @test_film_new.title = nil
        post :create, film: @test_film_new.attributes
        assert_template :new
    end  
end
