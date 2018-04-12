class User < ActiveRecord::Base
    has_secure_password
    has_many :films
    
    ROLES = [[1, :admin], [0, :member]]

    validates_presence_of :first_name, :last_name
    validates_inclusion_of :role, in: [0, 1]
    
    def role? (authorized_role)
      return false if role.nil?
      role.to_sym == authorized_role
    end
end
