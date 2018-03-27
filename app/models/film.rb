class Film < ActiveRecord::Base
    scope :alphabetical,  -> { order(title: :asc) }
    scope :base_films,    -> { where(film_type: 1) } # type 1 is base, type 2 is student
    scope :student_films, -> { where(film_type: 2) }
end
