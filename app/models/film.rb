class Film < ActiveRecord::Base
    fuzzily_searchable :title
    fuzzily_searchable :director
    
    PERMISSIONS = [['Public', 0], ['Partial', 1], ['Private', 2]]
    FILM_TYPES = [['Student', 0], ['Base Film', 1]]

    has_many :film_tags
    has_many :tags, through: :film_tags

    attr_accessor :tag_names

    mount_uploader :film_path, StudentFilmUploader
    mount_uploader :base_film_path, BaseFilmUploader
    mount_uploader :essay_path, EssayUploader
    # mount_uploader :image_path, ImageUploader

    validates_presence_of :title, :film_type, :director
    validates_presence_of :base_film_path, if: :is_base?
    validates_presence_of :film_path, unless: :is_base?
    validates_inclusion_of :permission, in: PERMISSIONS.to_h.values, message: "is not an option"

    scope :alphabetical,  -> { order(title: :asc) }
    scope :base_films,    -> { where(film_type: 1) } # type 1 is base, type 0 is student
    scope :student_films, -> { where(film_type: 0) }

    def is_base?
        self.film_type == 1
    end
end
