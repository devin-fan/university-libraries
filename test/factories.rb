FactoryBot.define do
    factory :user do
        first_name "Test"
        last_name  "User"
        role 1
        andrewid   "testu"
        password   "password"
        password_confirmation "password"
    end 
    factory :film do
        title "TestFilm1"
        film_type 0
        director "Tester"
        film_path { Rack::Test::UploadedFile.new(Rails.root.join('public', 'uploads', 'student_films', 'video-1517172393.mp4'), 'video/mp4') }
        essay_path { Rack::Test::UploadedFile.new(Rails.root.join('public', 'uploads', 'essays', 'function-extrema.docx'), 'application/vnd.openxmlformats-officedocument.wordprocessingml.document') }
        permission 1
        description "A test description"
        user_id :user
    end
    factory :film_tag do
        film :film
        tag :tag
    end
    factory :tag do
        name "testtag"
    end
 end 
