class Film < ActiveRecord::Base
    has_many :film_tags
    has_many :tags, through: :film_tags
    mount_uploader :student_film, StudentFilmUploader
    mount_uploader :essay, EssayUploader

    validates_presence_of :title, :tags, :essay_path, :film_type, :director, :film_path, :description
    validates_inclusion_of :permission, in: [0,1,2]

    scope :alphabetical,  -> { order(title: :asc) }
    scope :base_films,    -> { where(film_type: 0) } # type 1 is base, type 2 is student
    scope :student_films, -> { where(film_type: 1) }
end
