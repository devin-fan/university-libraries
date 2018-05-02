module Contexts
    module Films
        def create_films
            @film_one = FactoryBot.create(:film)
            @film_two = FactoryBot.create(:film, title: "TestFilm2")
            @base_film_one = FactoryBot.create(:film, title: "BaseFilm1", film_type: 1, base_film_path: Rack::Test::UploadedFile.new(Rails.root.join('public', 'uploads', 'base_films', 'video-1517172393.mp4'), 'video/mp4'))
        end

        def destroy_films
            @film_one.destroy!
            @film_two.destroy!
            @base_film_one.destroy!
        end
    end
end
