class TagsController < ApplicationController
    before_action :set_tag, only: [:show]

    def index
        @tags = Tag.alphabetical
    end

    def show
        @tagged_films = @tag.films.alphabetical.to_a.select do |f|
            can_view? f
	end
    end

    def create
        @tag = Tag.new(tag_params)
        @tag.save
    end

    def search
        search_query = params[:search]
        @matched_by_title = Film.find_by_fuzzy_title(search_query).to_a.select do |f|
            f.permission==0 or (logged_in? and current_user.role? :admin) or (logged_in? and current_user.role? :student and f.permission==1) or (logged_in? and f.user_id==current_user.id)
	end
        @matched_by_director = Film.find_by_fuzzy_director(search_query).to_a.select do |f|
            f.permission==0 or (logged_in? and current_user.role? :admin) or (logged_in? and current_user.role? :student and f.permission==1) or (logged_in? and f.user_id==current_user.id)
	end
        @matched_by_tag = Tag.find_by_fuzzy_name(search_query)
    end
    
    private
    def set_tag
        @tag = Tag.find(params[:id])
    end

    def tag_params
        params.require(:tag).permit(:name)
    end
end

