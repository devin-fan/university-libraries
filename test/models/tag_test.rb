require 'test_helper'

class TagTest < ActiveSupport::TestCase
    should have_many(:film_tags)
    should have_many(:films).through(:film_tags)

    should validate_presence_of(:name)

    context "Within context" do
        setup do 
            create_tags
        end 
        
        teardown do
            destroy_tags
        end
        
        should "test the functionality of has_name scope." do
            assert_equal ["testtag"], Tag.has_name("testtag").all.map(&:name)
        end
        
        should "test the functionality of alphabetical scope." do
            assert_equal ["testtag", "testtag2", "testtag3"], Tag.alphabetical.all.map(&:name)
        end
    end   

end
