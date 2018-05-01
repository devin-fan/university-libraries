class User < ActiveRecord::Base
    has_many :films
    has_secure_password

    validates_presence_of :first_name, :last_name
    validates_inclusion_of :role, in: [0, 1]

    def self.authenticate(andrewid, password)
        find_by_andrewid(andrewid).try(:authenticate, password)
    end

end
