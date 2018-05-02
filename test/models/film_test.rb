require 'test_helper'

class FilmTest < ActiveSupport::TestCase
    should have_many(:film_tags)
    should have_many(:tags).through(:film_tags)

    should validate_presence_of(:title)
    should validate_presence_of(:director)
    should validate_presence_of(:film_type)
    should validate_inclusion_of(:permission).in_array(Film::PERMISSIONS.to_h.values)

    context "Within context" do
        setup do
            create_films
        end

        teardown do
            destroy_films
        end
        
        should "test the functionality of alphabetical scope." do
            assert_equal ["BaseFilm1", "TestFilm1", "TestFilm2"], Film.alphabetical.all.map(&:title)
        end
        
        should "test the functionality of base_films scope." do
            assert_equal ["BaseFilm1"], Film.base_films.all.map(&:title)
        end

        should "test the functionality of student_films." do
            assert_equal ["TestFilm1", "TestFilm2"], Film.student_films.alphabetical.all.map(&:title)
        end

        should "test the functionality of is_base?." do
            assert @base_film_one.is_base?
        end
     end


end
