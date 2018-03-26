class Film < ActiveRecord::Base
    
#    validates :title, :director, presence: true
#    validates :film_path, presence: true
    
    scope :alphabetical,  -> { order(title: :asc) }
    scope :base_films,    -> { where(type: 1) } # type 1 is base, type 2 is student
    scope :student_films, -> { where(type: 2) } 

end
