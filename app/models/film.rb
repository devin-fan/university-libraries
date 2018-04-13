class Film < ActiveRecord::Base
    fuzzily_searchable :title
    fuzzily_searchable :director

    has_many :film_tags
    has_many :tags, through: :film_tags

    attr_accessor :tag_names

    mount_uploader :film_path, StudentFilmUploader
    mount_uploader :essay_path, EssayUploader

    validates_presence_of :title, :film_type, :director, :description
    validates_presence_of :base_film_path, if: :is_base?
    validates_inclusion_of :permission, in: [0,1,2]

    scope :alphabetical,  -> { order(title: :asc) }
    scope :base_films,    -> { where(film_type: 1) } # type 1 is base, type 0 is student
    scope :student_films, -> { where(film_type: 0) }

    def is_base?
        film_type == 1
    end
end
