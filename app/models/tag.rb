class Tag < ActiveRecord::Base
    has_many :film_tags
    has_many :films, through: :film_tags

    validates_presence_of :name

    scope :has_name, -> (in_name) { where(name: in_name) }
end
