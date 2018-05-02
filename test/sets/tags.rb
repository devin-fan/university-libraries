module Contexts
    module Tags
        def create_tags
            @tag_one = FactoryBot.create(:tag)
            @tag_two = FactoryBot.create(:tag, name: "testtag2")
            @tag_three = FactoryBot.create(:tag, name: "testtag3")
        end

        def destroy_tags
            @tag_one.destroy!
            @tag_two.destroy!
            @tag_three.destroy!
        end
    end
end
