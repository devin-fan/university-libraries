class Tag < ActiveRecord::Base
    has_many :films, through: :film_tags

    validates_presence_of :name
end
