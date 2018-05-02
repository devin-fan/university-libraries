module Contexts
    module Users
        def create_users
            @user_one = FactoryBot.create(:user)
        end

        def destroy_users
            @user_one.destroy!
        end
    end
end
