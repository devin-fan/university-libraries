class TagsController < ApplicationController
    before_action :set_tag, only: [:show]

    def index
        @tags = Tag.alphabetical
    end

    def show
        @tagged_films = @tag.films.alphabetical
    end

    def create
        @tag = Tag.new(tag_params)
        @tag.save
    end

    def search
        search_query = params[:search]
        @matched_by_title = Film.find_by_fuzzy_title(search_query)
        @matched_by_director = Film.find_by_fuzzy_director(search_query)
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

