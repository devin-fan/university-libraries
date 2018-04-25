class User < ActiveRecord::Base
    has_many :films

    validates_presence_of :first_name, :last_name
    validates_inclusion_of :role, in: [0, 1]
end
