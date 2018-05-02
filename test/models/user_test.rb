require 'test_helper'

class UserTest < ActiveSupport::TestCase
    should have_many(:films)
    
    should have_secure_password

    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)

    context "Within context" do
        setup do    
            create_users
        end
        
        teardown do
            destroy_users
        end
        
        should "test the functionality of authenticating." do
            assert User.authenticate("testu", "password")
        end
    end
end
