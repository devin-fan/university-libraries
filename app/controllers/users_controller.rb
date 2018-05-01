class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    def show
        @user_films = @user.films.alphabetical.to_a
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.role ||= 1
        if @user.save!
            session[:user_id] = @user.id
            redirect_to(@user, :notice => 'Account was successfully created.')
        else
            render :action => 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.new(user_params)
        if @user.save
            redirect_to(@user, :notice => 'Account information was successfully updated.')
        else
            render :action => 'edit'
        end
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :andrewid, :password, :password_confirmation)
    end

end
