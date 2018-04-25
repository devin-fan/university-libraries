class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    def show
        @user_films = @user.films.alphabetical.to_a
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

end
