class User < ActiveRecord::Base
    has_many :films
    has_secure_password
    
    ROLES = {admin: 0, student: 1}

    validates_presence_of :first_name, :last_name
    validates_inclusion_of :role, in: [0, 1]

    scope :alphabetical, -> { order(andrewid: :asc) }

    def self.authenticate(andrewid, password)
        find_by_andrewid(andrewid).try(:authenticate, password)
    end

    def role?(authorized_role)
        return false if self.role.nil?
        puts authorized_role, ROLES[authorized_role], self.role
        self.role == ROLES[authorized_role]
    end

    def name
    	last_name + ", " + first_name
    end

end
